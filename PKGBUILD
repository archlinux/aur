# Maintainer: Equationzhao <equationzhao at foxmail dot com>
pkgname='g-ls'
pkgver=0.9.0
pkgrel=1
pkgdesc='a powerful ls in golang'
arch=($CARCH)
url='https://github.com/Equationzhao/g'
license=('MIT')
makedepends=('go')
backup=("etc/$pkgname/config.conf")
source=("g-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('663dc5361cf131f3c4a5b7b5445571e3735ddfc8db02dc099d024ea1715e8c2b')


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
