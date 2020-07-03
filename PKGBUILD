# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
# Contributor: Martino Pilia <martino.pilia@gmail.com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: SleepyDog

_name=glew
pkgname="${_name}-2.1"
pkgver=2.1.0
pkgrel=1
pkgdesc="The OpenGL Extension Wrangler Library"
arch=('i686' 'x86_64')
url="http://glew.sourceforge.net"
license=('BSD' 'MIT' 'GPL')
depends=('libxmu' 'libxi' 'glu')
source=("http://downloads.sourceforge.net/${_name}/${_name}-${pkgver}.tgz")
sha256sums=('04de91e7e6763039bc11940095cd9c7f880baba82196a7765f727ac05a993c95')

build() {
    cd ${_name}-${pkgver}

    sed -i 's|lib64|lib|' config/Makefile.linux
    sed -i '/^.PHONY: .*\.pc$/d' Makefile
    make
}

package() {
    cd ${_name}-${pkgver}
    make GLEW_DEST="${pkgdir}/usr" install.all
    rm -rf "${pkgdir:?}/usr/bin"
    mkdir "${pkgdir}/usr/include/GL/glew2.1"
    mv "${pkgdir}/usr/include/GL"/*.h "${pkgdir}/usr/include/GL/glew2.1"/.
    mv "${pkgdir}/usr/lib/pkgconfig/glew.pc" "${pkgdir}/usr/lib/pkgconfig/glew-2.1.pc"
    mv "${pkgdir}/usr/lib/libGLEW.so" "${pkgdir}/usr/lib/libGLEW2.1.so"
    mv -v "${pkgdir}/usr/lib/libGLEW.a" "${pkgdir}/usr/lib/libGLEW2.1.a"
}
