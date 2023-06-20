# Maintainer: Equationzhao <equationzhao at foxmail dot com>
pkgname='g-ls'
pkgver=0.8.3
pkgrel=1
pkgdesc='a powerful ls in golang'
arch=($CARCH)
url='https://github.com/Equationzhao/g'
license=('MIT')
makedepends=('go')
backup=("etc/$pkgname/config.conf")
source=("g-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('870412bdea608541aa501e5e416554e6ab4f98d68da876fdf682d6e88a3d33a2')


build() {
    cd "$srcdir/g-$pkgver"
    go build -ldflags="-s -w -v -X main.compiledAt=$(date +%Y%m%d%H%M%S)" -o g
}

package() {
    cd "$srcdir/g-$pkgver"
    mkdir -p "$pkgdir/usr/bin"
    install -m755 g "$pkgdir/usr/bin"
    cd man
    install -Dm644 g.1.gz "$pkgdir/usr/share/man/man1/g.1.gz"
}
