# Maintainer: André Kugland <kugland at gmail dot com>

pkgname=fastrandom
pkgver=1.0.5
pkgrel=1
pkgdesc="Quickly generate large amounts of cryptographically insecure
pseudo-random data"
arch=("x86_64")
url="https://gitlab.com/kugland/fastrandom"
license=("MIT")
makedepends=('make')
checkdepends=('rng-tools')
source=("https://gitlab.com/kugland/fastrandom/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('1535d7370c97cc3dea82346168c2d40ad049c0f64d40b35e7b8753d2f0e54e96')

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
