# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=cpuid2cpuflags
pkgver=11
pkgrel=1
pkgdesc='Tool to get the instruction sets supported by your CPU'
arch=('x86_64')
url='https://github.com/mgorny/cpuid2cpuflags/'
license=('BSD')
depends=('glibc')
source=("https://github.com/mgorny/cpuid2cpuflags/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('5c4b21b41e90f86225f155205edcf85309ad1aae131a6a7c75cba40459d3c36c')

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
