# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix

pkgname=textosaurus
epoch=1
pkgver=0.9.3.1
pkgrel=1
pkgdesc="Simple cross-platform text editor based on Qt and Scintilla"
arch=('x86_64' 'i686')
url="https://github.com/martinrotter/textosaurus"
license=(GPL3)
depends=('qt5-base' 'qt5-svg')
makedepends=('git' 'qt5-tools')
provides=('textosaurus')
conflicts=('textosaurus' 'textosaurus-git')
replaces=('textilosaurus')
_commit=1710f53c81dbcf4788fd23ebaabf6ec77a4a3fb6
source=("git+https://github.com/martinrotter/textosaurus#commit=$_commit")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd "${srcdir}/${pkgname}"
  install -d build

  git submodule init
  git submodule update
}

build() {
  cd "${srcdir}/${pkgname}/build"
  qmake ../textosaurus.pro -r CONFIG+=release PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}/build"
  make install INSTALL_ROOT="${pkgdir}/"
}
