# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=cpuid2cpuflags
pkgver=14
pkgrel=1
pkgdesc='Tool to get the instruction sets supported by the local CPU'
arch=('x86_64')
url='https://github.com/mgorny/cpuid2cpuflags/'
license=('BSD')
depends=('glibc')
source=("https://github.com/mgorny/cpuid2cpuflags/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('ffa9f148fd4b895a1a0d061c99d8f5592023d454ea55bdc303e7e5dae219fddb')

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
    install -D -m644 "${pkgname}-${pkgver}/COPYING" -t "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
