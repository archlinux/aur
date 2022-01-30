# Maintainer: André Kugland <kugland at gmail dot com>

pkgname=fastrandom
pkgver=1.0.6
pkgrel=1
pkgdesc="Quickly generate large amounts of cryptographically insecure
pseudo-random data"
arch=("x86_64")
url="https://gitlab.com/kugland/fastrandom"
license=("MIT")
makedepends=('make')
checkdepends=('rng-tools')
source=("https://gitlab.com/kugland/fastrandom/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('6a5b76ee42cdd1dad3f1c20c17a183fe680fbdb0169c7bf55abe8cadcd926a92')

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
