# Maintainer: Christian Muehlhaeuser <muesli at gmail dot com>

pkgname=magicwand
pkgver=0.1.0
pkgrel=1
pkgdesc="MagicWand makes your input devices context sensitive"
arch=('x86_64')
url="https://github.com/muesli/magicwand"
license=('MIT')
makedepends=('go')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('381e5eccfa512f484e1b0536a76d72e53c9bc46da99fafeb398c61ca1adff983')

build() {
    cd "$pkgname-$pkgver"
    go build \
        -trimpath \
        -ldflags "-X main.Version=$pkgver -extldflags $LDFLAGS" \
        -o "magicwand" .
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "magicwand" "$pkgdir/usr/bin/magicwand"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
