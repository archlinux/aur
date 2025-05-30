# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=cpuid2cpuflags
pkgver=16
pkgrel=1
pkgdesc='Tool to get the instruction sets supported by the local CPU'
arch=('x86_64')
url='https://github.com/mgorny/cpuid2cpuflags/'
license=('GPL-2.0-or-later')
depends=('glibc')
source=("https://github.com/mgorny/cpuid2cpuflags/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('fcdcdd18a1db05ace8720c309aa2c96aca6ef556fb069ba2ab57298916fdae5d')

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
