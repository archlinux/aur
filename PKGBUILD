# Maintainer: Djwarf <fettahdjwar@gmail.com>
pkgname=switchcal
pkgver=1.1.0
pkgrel=1
pkgdesc="GTK4 calendar application with Google Calendar sync and waybar integration"
arch=('x86_64')
url="https://github.com/Djwarf/switchcal"
license=('MIT')
depends=('gtk4' 'glib2' 'sqlite')
makedepends=('go' 'gcc')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$pkgname-$pkgver"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath"
    go build -o switchcal ./cmd/switchcal
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 switchcal "$pkgdir/usr/bin/switchcal"
    install -Dm644 switchcal.desktop "$pkgdir/usr/share/applications/switchcal.desktop"
}
