# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=editorconfig-qtcreator
_pkgver=0.3.0
_qtcreatorver=4.5.0
pkgver=${_pkgver}+${_qtcreatorver}
pkgrel=1
pkgdesc="EditorConfig Plugin for QtCreator"
url="https://github.com/editorconfig/editorconfig-qtcreator"
arch=('i686' 'x86_64')
license=('LGPL')
depends=("qtcreator=${_qtcreatorver}" "editorconfig-core-c")
source=("https://github.com/editorconfig/${pkgname}/archive/${_pkgver}.tar.gz"
        "http://download.qt.io/official_releases/qtcreator/${_qtcreatorver%.*}/${_qtcreatorver}/qt-creator-opensource-src-${_qtcreatorver}.tar.xz")
md5sums=('cb40d30d0e2b703296c2a4fb29796033'
         '27f7f93ac387216ff69510d0188cd599')

build() {
  cd "${srcdir}/${pkgname}-${_pkgver}"

  mkdir -p ../pseudo-ide-build-tree/lib
  cp -a /usr/lib/qtcreator ../pseudo-ide-build-tree/lib

  mkdir build
  cd build
  qmake QTCREATOR_SOURCES="${srcdir}/qt-creator-opensource-src-${_qtcreatorver}" IDE_BUILD_TREE="${srcdir}/pseudo-ide-build-tree" ..
  make
}

package() {
  cd "${srcdir}/${pkgname}-${_pkgver}/build"

  make install INSTALL_ROOT="${pkgdir}/usr"
}
