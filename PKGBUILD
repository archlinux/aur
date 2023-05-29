# Maintainer: Equationzhao <equationzhao at foxmail dot com>
pkgname='g-ls'
pkgver=0.5.5
pkgrel=1
pkgdesc='a powerful ls in golang'
arch=($CARCH)
url='https://github.com/Equationzhao/g'
license=('MIT')
makedepends=('go')
backup=("etc/$pkgname/config.conf")
source=("g-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a7cd60ff99339426f4d081f18e2664d378dad6cda287bb719c1ad2905f6e442e')


build() {
    cd "$srcdir/g-$pkgver"
    go build -ldflags="-s -w -v -X main.compiledAt=$(date +%Y%m%d%H%M%S)" -o g
}

package() {
    cd "$srcdir/g-$pkgver"
    mkdir -p "$pkgdir/usr/bin"
    install -m755 g "$pkgdir/usr/bin"
    cd man
    gzip g.1
    install -Dm644 g.1.gz "$pkgdir/usr/share/man/man1/g.1.gz"
}
