# Maintainer: Nathan Craddock <contact@nathancraddock.com>
pkgname=zf
pkgver=0.6.0
pkgrel=1
pkgdesc="A commandline fuzzy finder that prioritizes matches on filenames"
arch=('x86_64')
license=('MIT')
makedepends=('git' 'zig')
provides=(zf)
url="https://github.com/natecraddock/zf"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('9767ce1142933c753b749630229d10519c4c0b208f63931e43495acc632135e2')

build() {
    cd "$pkgname-$pkgver"
    zig build -Drelease-fast=true
}

package() {
    cd "$pkgname-$pkgver"
    install -D -m755 zig-out/bin/zf "$pkgdir/usr/bin/zf"
    install -D -m644 doc/zf.1 "$pkgdir/usr/share/man/man1/zf.1"
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -D -m644 complete/zf "$pkgdir/usr/share/bash-completion/completions/zf"
    install -D -m644 complete/_zf "$pkgdir/usr/share/zsh/site-functions/_zf"
    install -D -m644 complete/zf.fish "$pkgdir/usr/share/fish/completions/zf.fish"
}
