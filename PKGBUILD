# Maintainer: Sergey A. <murlakatamenka@disroot.org>

pkgname=intermodal
pkgver=0.1.5
pkgrel=1
pkgdesc="User-friendly and featureful CLI BitTorrent metainfo utility, written in Rust"
arch=('x86_64')
url="https://github.com/casey/intermodal"
license=('custom:CC0')
makedepends=('cargo')
conflicts=('intermodal-bin')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('104528437aa21f1afeea57031848b2c93676963a5b2f7702eee9d96fc4141635')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked
}

package() {
    cd "$pkgname-$pkgver"

    # binary
    install -Dm 755 "target/release/imdl"  "$pkgdir/usr/bin/imdl"

    # shell completions
    install -Dm644 "completions/imdl.zsh" "$pkgdir/usr/share/zsh/site-functions/_imdl"
    install -Dm644 "completions/imdl.bash" "$pkgdir/usr/share/bash-completion/completions/imdl"
    install -Dm644 "completions/imdl.fish" "$pkgdir/usr/share/fish/vendor_completions.d/imdl.fish"

    # man pages
    install -Dm644 man/*.1 -t "$pkgdir/usr/share/man/man1/"

    # license
    install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
