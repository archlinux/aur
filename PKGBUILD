# Maintainer: Jonathan Liu <net147@gmail.com>
pkgname=glc-lib
pkgver=2.5.0
pkgrel=2
pkgdesc="OpenGL Library Class"
arch=('i686' 'x86_64')
url="http://www.glc-lib.net/"
license=('LGPL')
depends=('mesa' 'qt4')
source=("https://github.com/laumaya/GLC_lib/archive/Version_${pkgver//./_}.zip"
        "glu.patch"
        "zlib.patch")
md5sums=('0cb9fc5609fcbcbb2148e50377d8bf0d'
         '80bb3acdf8a360a3169ac268acee463d'
         '687ed819254496d964ce9e9d3a5e672a')

prepare() {
  cd "${srcdir}/GLC_lib-Version_${pkgver//./_}"
  patch -Np1 -i "${srcdir}/glu.patch"
  patch -Np1 -i "${srcdir}/zlib.patch"
  sed -i -e 's#/usr/local/#/usr/#g' install.pri
  sed -i -e 's#SUBDIRS += src examples#SUBDIRS += src#' glc_lib.pro
  qmake-qt4
}

build() {
  cd "${srcdir}/GLC_lib-Version_${pkgver//./_}"
  make
}

package() {
  cd "${srcdir}/GLC_lib-Version_${pkgver//./_}"
  make INSTALL_ROOT="${pkgdir}" install
  install -d "${pkgdir}/usr/include"
  ln -sf GLC_lib-2.5 "${pkgdir}/usr/include/GLC_lib"
}

# vim:set ts=2 sw=2 et:
