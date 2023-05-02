# Maintainer: Equationzhao <equationzhao at foxmail dot com>
pkgname='g-ls'
pkgver=0.4.1
pkgrel=1
pkgdesc='a powerful ls in golang'
arch=($CARCH)
url='https://github.com/Equationzhao/g'
license=('MIT')
makedepends=('go')
backup=("etc/$pkgname/config.conf")
source=("g-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1f8ea87cced43c5bcfb8b6b1b8dae739ce3a7e35e05479583d7ddc8d2f474a90')

build() {
    cd "$srcdir/g-$pkgver"
    go build -ldflags="-s -w -v" -o g
}

package() {
    cd "$srcdir/g-$pkgver"
    mkdir -p "$pkgdir/usr/bin"
    install -m755 g "$pkgdir/usr/bin"
    cd man
    gzip g.1
    install -Dm644 g.1.gz "$pkgdir/usr/share/man/man1/g.1.gz"
}