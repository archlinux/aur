# Maintainer: Nathan Craddock <contact@nathancraddock.com>
pkgname=zf
pkgver=0.0.1
pkgrel=1
pkgdesc="A commandline fuzzy finder that prioritizes matches on filenames"
arch=('x86_64')
license=('MIT')
makedepends=('git' 'zig')
provides=(zf)
url="https://github.com/natecraddock/zf"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('0e4443c2d69bf05148daa63f5a926e2bd5b43e448e9f8b8acd58ff588835e49f')

build() {
    cd "$pkgname-$pkgver"
    zig build -Drelease-fast=true
}

package() {
    cd "$pkgname-$pkgver"
    install -D -m755 zig-out/bin/zf "$pkgdir/usr/bin/zf"
    install -D -m644 doc/zf.1 "$pkgdir/usr/share/man/man1/zf.1"
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
