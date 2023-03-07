# Maintainer: Loic Coyle <loic.coyle@hotmail.fr>

pkgname=thqm
pkgdesc='A simple HTTP server to serve a dynamic menu for your scripts over the network.'
pkgver=0.1.6
pkgrel=1
arch=('any')
url='https://github.com/loiccoyle/thqm-rs'
license=('MIT')
depends=('git')
makedepends=('rust')
source=("$pkgname-${pkgver}.tar.gz::https://github.com/loiccoyle/thqm.rs/archive/v${pkgver}.tar.gz")
sha256sums=('3259815a7bc41e8fc2041935d5c170f37a7d5ce87f1854f68ef2e5156129a0ad')

build() {
    cd "$pkgname-rs-$pkgver"
    cargo build --release --locked
}

package() {
    cd "$pkgname-rs-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    # completions
    install -Dm644 "completions/$pkgname" "$pkgdir/usr/share/bash-completion/completions/$pkgname"
    install -Dm644 "completions/$pkgname.fish" "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"
    install -Dm644 "completions/_$pkgname" "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
}
