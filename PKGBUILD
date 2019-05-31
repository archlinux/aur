# Maintainer: Christian Muehlhaeuser <muesli at gmail dot com>

pkgname=sync3c
pkgver=0.1
pkgrel=1
pkgdesc="A little tool to sync/download media from https://media.ccc.de"
arch=('x86_64')
url="https://github.com/muesli/sync3c"
license=('MIT')
makedepends=('go')
source=("https://github.com/muesli/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('2722e4b42b73c1a5ed9b10dcb3a66a8bc3107c6f501f2de236c54f0783529ca9')

prepare() {
    cd "$pkgname-$pkgver"
    GOPATH=`pwd` go get -d -v
}

build() {
    cd "$pkgname-$pkgver"
    GOPATH=`pwd` go build
}

package() {
    cd "$pkgname-$pkgver"

    # Install binary
    install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$pkgname"
    # Copy License
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
