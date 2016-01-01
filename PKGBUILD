# $Id$
# Maintainer: Gryffyn
# Orginal Arch Maintainer: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: SleepyDog

pkgname=glew1.13
pkgver=1.13.0
pkgrel=1
pkgdesc="The OpenGL Extension Wrangler Library"
arch=('i686' 'x86_64')
url="http://glew.sourceforge.net"
license=('BSD' 'MIT' 'GPL')
depends=('libxmu' 'libxi' 'mesa' 'glew')
source=(http://downloads.sourceforge.net/glew/glew-1.13.0.tgz)
md5sums=('7cbada3166d2aadfc4169c4283701066')

build() {
  cd "${srcdir}/glew-${pkgver}"
  sed -i 's|lib64|lib|' config/Makefile.linux
  make
}

package() {
  cd "${srcdir}/glew-${pkgver}"
  make GLEW_DEST="${pkgdir}/usr" install.all
  rm -R -f ${pkgdir}/usr/{bin,include,share}
  rm -R -f ${pkgdir}/usr/lib/pkgconfig
  rm -f ${pkgdir}/usr/lib/{libGLEW.so,libGLEWmx.so}

  rm "${pkgdir}"/usr/lib/{libGLEW,libGLEWmx}.a
  chmod 0755 "${pkgdir}"/usr/lib/libGLEW*.so.${pkgver}
}
