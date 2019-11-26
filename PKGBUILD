# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: SleepyDog

_name=glew
pkgname="${_name}-2.0"
pkgver=2.0.0
pkgrel=1
pkgdesc="The OpenGL Extension Wrangler Library"
arch=('i686' 'x86_64')
url="http://glew.sourceforge.net"
license=('BSD' 'MIT' 'GPL')
depends=('libxmu' 'libxi' 'glu')
source=("http://downloads.sourceforge.net/${_name}/${_name}-${pkgver}.tgz")
sha1sums=('6e15c84f7e1fad34cd3679f784a233744ddf048f')

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
  mkdir "${pkgdir}/usr/include/GL/glew2.0"
  mv "${pkgdir}/usr/include/GL"/*.h "${pkgdir}/usr/include/GL/glew2.0"/.
  mv "${pkgdir}/usr/lib/pkgconfig/glew.pc" "${pkgdir}/usr/lib/pkgconfig/glew-2.0.pc"
  mv "${pkgdir}/usr/lib/libGLEW.so" "${pkgdir}/usr/lib/libGLEW2.0.so"
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
