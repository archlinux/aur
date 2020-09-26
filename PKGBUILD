# Maintainer: Christian Muehlhaeuser <muesli at gmail dot com>

pkgname=duf
pkgver=0.3.1
pkgrel=1
pkgdesc="Disk Usage/Free Utility"
arch=('x86_64' 'i686')
url="https://github.com/muesli/duf"
license=('MIT')
makedepends=('go')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('98b5cdc4a7b3c5eddc0ec397c65860110b446e85cc4f3cfe3e32f31ce524e90d')

build() {
    cd "$pkgname-$pkgver"
    go build \
        -trimpath \
        -ldflags "-X main.Version=$pkgver -extldflags $LDFLAGS" \
        -o "duf" .
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "duf" "$pkgdir/usr/bin/duf"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=4 sw=4 et:
