# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=editorconfig-qtcreator
_pkgver=0.3.0
_qtcreatorver=4.7.1
pkgver=${_pkgver}+${_qtcreatorver}
pkgrel=1
pkgdesc="EditorConfig Plugin for QtCreator"
url="https://github.com/editorconfig/editorconfig-qtcreator"
arch=('i686' 'x86_64')
license=('LGPL')
depends=("qtcreator=${_qtcreatorver}" "editorconfig-core-c")
source=("https://github.com/editorconfig/${pkgname}/archive/${_pkgver}.tar.gz"
        "http://download.qt.io/official_releases/qtcreator/${_qtcreatorver%.*}/${_qtcreatorver}/qt-creator-opensource-src-${_qtcreatorver}.tar.xz")
sha512sums=('28f36cd90834d5ebfd004cf708898514c1ed9f5b00f7a9bc08482cbf9b05efa2068ca97d7debc7f4aedbbd7115cd4d96795280c5e726063c0d2bcf3adf4d25f9'
            '839db5409c65b33293fcd21bbf3c6ec1900f640a05451d94d8d6df0421bb56d34f1fd98b9dc5a5f1ab2cb05a65dc2b23532b44c0687c3ca9d310b629474d2461')

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
