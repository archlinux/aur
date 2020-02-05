# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=swaynag-battery
pkgver=0.1.1
pkgrel=1
pkgdesc="Shows a message when your battery is discharging"
arch=('x86_64' 'i686')
url="https://github.com/m00qek/swaynag-battery"
license=('MIT')
makedepends=('go')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('6c36fa0d7804e1b959d8207b5bdc24b95f499f8d403833ec470d83765af2ec16')

build() {
    cd "$pkgname-$pkgver"
    go build \
        -trimpath \
        -ldflags "-X main.Version=$pkgver -extldflags $LDFLAGS" \
        -o $pkgname .
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=4 sw=4 et:
