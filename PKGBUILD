# Maintainer: Christian Muehlhaeuser <muesli at gmail dot com>

pkgname=sync3c
pkgver=0.2.0
pkgrel=1
pkgdesc="A little tool to sync/download media from https://media.ccc.de"
arch=('x86_64')
url="https://github.com/muesli/sync3c"
license=('MIT')
makedepends=('go')
source=("https://github.com/muesli/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('9fd4c8ce61454daaa662a04f7f128dca54b31166c6d2f9783926071fc3a6aa6a')

build() {
    cd "$pkgname-$pkgver"
    go build \
        -trimpath \
        -ldflags "-X main.Version=$pkgver -extldflags $LDFLAGS" \
        -o "$pkgname" .
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
