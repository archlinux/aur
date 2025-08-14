# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=cpuid2cpuflags
pkgver=17
pkgrel=1
pkgdesc='Tool to get the instruction sets supported by the local CPU'
arch=('x86_64')
url='https://github.com/mgorny/cpuid2cpuflags/'
license=('GPL-2.0-or-later')
depends=('glibc')
source=("https://github.com/mgorny/cpuid2cpuflags/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('e6f9494ef25cbe1e2aa671a9f5f80d7dc484167de32d3af72c91be672ced9c90')

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
