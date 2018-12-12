# Maintainer: Daniel Bermond < gmail-com: danielbermond >

pkgname=dav1d
pkgver=0.1.0
pkgrel=1
pkgdesc='AV1 cross-platform decoder focused on speed and correctness'
arch=('i686' 'x86_64')
url='https://code.videolan.org/videolan/dav1d/'
license=('BSD')
depends=('glibc')
makedepends=('git' 'meson' 'ninja' 'nasm' 'doxygen')
source=("https://code.videolan.org/videolan/dav1d/-/archive/${pkgver}/dav1d-${pkgver}.tar.bz2")
sha256sums=('923f78d17aed08252608790eaed06a3d530763168fd6a8fc74e3306d7e01e6a5')

build () {
    cd "${pkgname}-${pkgver}"
    
    arch-meson . build -D build_tests='true'
    
    ninja -C build
}

check() {
    cd "${pkgname}-${pkgver}/build"
    
    meson test
}

package () {
    cd "${pkgname}-${pkgver}"
    
    DESTDIR="$pkgdir" ninja -C build install
    
    install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m644 doc/PATENTS -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
