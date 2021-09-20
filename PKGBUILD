# Contributor: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Felix Schindler <aur at felixschindler dot net>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Imanol Celaya <ornitorrincos@archlinux-es.org>
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: Dan Vratil <progdan@progdansoft.com>
# Contributor: thotypous <matiasΘarchlinux-br·org>
# Contributor: delor <bartekpiech gmail com>

pkgname=qtcreator42
pkgver=4.2.2
pkgrel=2
pkgdesc='Lightweight, cross-platform integrated development environment (4.2.x)'
arch=('i686' 'x86_64')
url='http://qt-project.org'
license=('LGPL')
depends=('qt5-tools' 'qt5-quickcontrols' 'qt5-quickcontrols2' 'qt5-webengine' 'clang' 'qt5-script')
makedepends=('git' 'mesa' 'llvm')
options=('docs')
optdepends=('qt5-doc: integrated Qt documentation'
            'qt5-examples: welcome page examples'
            'qt5-translations: for other languages'
            'gdb: debugger'
            'cmake: cmake project support'
            'x11-ssh-askpass: ssh support'
            'git: git support'
            'mercurial: mercurial support'
            'bzr: bazaar support'
            'valgrind: analyze support')
provides=('qtcreator=4.2.2')
conflicts=('qtcreator')
source=("https://download.qt.io/archive/qtcreator/4.2/${pkgver}/qt-creator-opensource-src-${pkgver}.tar.xz")
md5sums=('e63ed4d896b1b83dd9bb9c8e66c227d1')
sha512sums=('cab23a75b3b8ef68cadf4fe57b81e96ef647bb48ab4c57618bf6dd25aed50abb412ac7fa76848b97da01f2df589ec763c95321956506aa4f159383f188efbf2d')

build() {
  [[ -d build ]] && rm -r build
  mkdir build && cd build

  LLVM_INSTALL_DIR=/usr qmake QMAKE_CFLAGS_ISYSTEM=-I \
    CONFIG+=journald -r ../qt-creator-opensource-src-${pkgver}/qtcreator.pro
  make
  make docs
}

package() {
  cd build

  make INSTALL_ROOT="${pkgdir}/usr/" install
  make INSTALL_ROOT="${pkgdir}/usr/" install_docs

  install -Dm644 ${srcdir}/qt-creator-opensource-src-${pkgver}/LICENSE.GPL3-EXCEPT ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.GPL3-EXCEPT
}
