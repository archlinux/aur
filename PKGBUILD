# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=cpuid2cpuflags
pkgver=13
pkgrel=1
pkgdesc='Tool to get the instruction sets supported by the local CPU'
arch=('x86_64')
url='https://github.com/mgorny/cpuid2cpuflags/'
license=('BSD')
depends=('glibc')
source=("https://github.com/mgorny/cpuid2cpuflags/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('3bf757f34b8ba7aed0087d87b7da4028a45896ddb4242bb4ec7745795ab5ddff')

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
