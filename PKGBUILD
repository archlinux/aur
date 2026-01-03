# Maintainer: Endg4me_ <timka.tarasen at gmail.com>
pkgname=lrcsnc
pkgver=0.1.2
pkgrel=1
pkgdesc="🎶 Synced lyrics fetcher and synchronizer that works with any of your MPRIS-capable players!"
arch=('x86_64' 'aarch64')
url="https://github.com/Endg4meZer0/lrcsnc"
license=('MIT')
makedepends=('go>=1.23')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Endg4meZer0/lrcsnc/archive/v${pkgver}.tar.gz")
sha256sums=('adb236b9be4582b968420d1b4d72a778f21484ffca22055004da7e11ffe7528f')

build() {
    export GOPATH="$srcdir/gopath"
    export GOFLAGS="-mod=readonly -modcacherw"

    cd "$srcdir/$pkgname-$pkgver"
    make VERSION="v$pkgver" DESTDIR="$pkgdir" PREFIX="/usr" build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make VERSION="v$pkgver" DESTDIR="$pkgdir" PREFIX="/usr" install
}