# Maintainer: Sergey A. <murlakatamenka@disroot.org>

pkgname=intermodal
pkgver=0.1.6
pkgrel=1
pkgdesc="User-friendly and featureful CLI BitTorrent metainfo utility, written in Rust"
arch=('x86_64')
url="https://github.com/casey/intermodal"
license=('custom:CC0')
makedepends=('cargo')
conflicts=('intermodal-bin')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('ed31a15642d74b89f2d1ee556e02aee216b9c70e9663615224c57b846e793f0e')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked
}

package() {
    cd "$pkgname-$pkgver"

    # binary
    install -Dm 755 "target/release/imdl"  "$pkgdir/usr/bin/imdl"

    # shell completions
    install -Dm644 "completions/_imdl" "$pkgdir/usr/share/zsh/site-functions/_imdl"
    install -Dm644 "completions/imdl.bash" "$pkgdir/usr/share/bash-completion/completions/imdl"
    install -Dm644 "completions/imdl.fish" "$pkgdir/usr/share/fish/vendor_completions.d/imdl.fish"

    # man pages
    install -Dm644 man/*.1 -t "$pkgdir/usr/share/man/man1/"

    # license
    install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
