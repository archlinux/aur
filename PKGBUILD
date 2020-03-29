# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=cpuid2cpuflags
pkgver=8
pkgrel=1
pkgdesc='Tool to generate CPU_FLAGS_* for your CPU'
arch=('x86_64')
url='https://github.com/mgorny/cpuid2cpuflags/'
license=('BSD')
depends=('glibc')
source=("https://github.com/mgorny/cpuid2cpuflags/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('db8d361e9c2ec7568ec2728b84f92412d482dc78a357e226e2bd747eb97af7a1')

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
