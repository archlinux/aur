# Maintainer: André Kugland <kugland at gmail dot com>

pkgname=fastrandom
pkgver=1.0.8
pkgrel=1
pkgdesc="Quickly generate large amounts of cryptographically insecure
pseudo-random data"
arch=("x86_64")
url="https://gitlab.com/kugland/fastrandom"
license=("MIT")
makedepends=('make')
checkdepends=('rng-tools')
source=("https://gitlab.com/kugland/fastrandom/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('270e2805f3ba71d5d49da88ad92098907db97069347c7fd6ad51afe3650e550f')

build() {
    LDFLAGS="$LDFLAGS -Wl,--no-as-needed"
    make -C "${pkgname}-v${pkgver}" DESTDIR="$pkgdir"
}

check() {
    make -C "${pkgname}-v${pkgver}" test
}

package() {
    make -C "${pkgname}-v${pkgver}" DESTDIR="$pkgdir" install
}
