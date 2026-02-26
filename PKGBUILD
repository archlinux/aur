# Maintainer: Endg4me_ <timka.tarasen at gmail.com>
pkgname=lrcsnc
pkgver=0.1.3_1
pkgrel=1
pkgdesc="🎶 Synced lyrics fetcher and synchronizer that works with any of your MPRIS-capable players!"
arch=('x86_64' 'aarch64')
url="https://github.com/Endg4meZer0/lrcsnc"
license=('MIT')
makedepends=('go>=1.23')
source=("${pkgname}-${pkgver//_/-}.tar.gz::https://github.com/Endg4meZer0/lrcsnc/archive/v${pkgver//_/-}.tar.gz")
sha256sums=('6465657dc2745dc10d0df880adaaf8477bab8cd0097d532f13ea428336656ab0')

build() {
    export GOPATH="$srcdir/gopath"
    export GOFLAGS="-mod=readonly -modcacherw"

    cd "$srcdir/$pkgname-${pkgver//_/-}"
    make VERSION="v${pkgver//_/-}" DESTDIR="$pkgdir" PREFIX="/usr" build
}

package() {
    cd "$srcdir/$pkgname-${pkgver//_/-}"
    make VERSION="v${pkgver//_/-}" DESTDIR="$pkgdir" PREFIX="/usr" install
}