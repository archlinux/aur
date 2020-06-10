# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=cpuid2cpuflags
pkgver=10
pkgrel=1
pkgdesc='Tool to get the instruction sets supported by your CPU'
arch=('x86_64')
url='https://github.com/mgorny/cpuid2cpuflags/'
license=('BSD')
depends=('glibc')
source=("https://github.com/mgorny/cpuid2cpuflags/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('1d72ba3c1d3a6baf637feccaa01b8ec2894809473de11ceb7a00cecef627ac6b')

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
    install -D -m644 "${pkgname}-${pkgver}/COPYING" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
