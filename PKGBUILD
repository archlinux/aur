# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix

pkgname=textosaurus
pkgver=2018.03.26
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
_commit=513ce234eef077902e24196d3fb93773e1eff0d5
source=("git+https://github.com/martinrotter/textosaurus#commit=$_commit")
md5sums=('SKIP')

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
