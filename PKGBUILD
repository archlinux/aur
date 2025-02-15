# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=cpuid2cpuflags
pkgver=15
pkgrel=1
pkgdesc='Tool to get the instruction sets supported by the local CPU'
arch=('x86_64')
url='https://github.com/mgorny/cpuid2cpuflags/'
license=('GPL-2.0-or-later')
depends=('glibc')
source=("https://github.com/mgorny/cpuid2cpuflags/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('e8a1d9a4bcf0d7e0d38933890ac4d2de96bcbaeb57ae8844883fdfb05f6f8804')

prepare() {
    autoreconf -fi "${pkgname}-${pkgver}"
}

build() {
    cd "${pkgname}-${pkgver}"
    ./configure --prefix='/usr'
    make
}

check() {
    make -C "${pkgname}-${pkgver}" check
}

package() {
    make -C "${pkgname}-${pkgver}" DESTDIR="$pkgdir" install
}
