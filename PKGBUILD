# Maintainer: Loic Coyle <loic.coyle@hotmail.fr>

pkgname=thqm
pkgdesc='A simple HTTP server to serve a dynamic menu web page.'
pkgver=0.2.1
pkgrel=1
arch=('any')
url='https://github.com/loiccoyle/thqm-rs'
license=('MIT')
depends=('git')
makedepends=('rust')
source=("$pkgname-${pkgver}.tar.gz::https://github.com/loiccoyle/thqm.rs/archive/v${pkgver}.tar.gz")
sha256sums=('58e489ba95b288c23129d00dd5ba4cd0672a3b8b7a40d7a0ecbce31d6fa1c68c')

build() {
    cd "$pkgname-rs-$pkgver"
    cargo build --release --locked
}

package() {
    cd "$pkgname-rs-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    # completions
    install -Dm644 "completions/$pkgname.bash" "$pkgdir/usr/share/bash-completion/completions/$pkgname"
    install -Dm644 "completions/$pkgname.fish" "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"
    install -Dm644 "completions/_$pkgname" "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
}
