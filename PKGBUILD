#
# PKGBUILD for qtcbm
#
# Contributor: Uffe Jakobsen <microtop@starion.dk>
# Contributor: Jochen Jägers <jochen.jaegers@gmail.com>
# Maintainer: Jochen Jägers <jochen.jaegers@gmail.com>
#
pkgname=qtcbm
pkgver=1.1.0
pkgrel=1
epoch=
pkgdesc="Qt GUI Frontend for the (Open)CBM utils"
arch=('i686' 'x86_64')
_pkgname=QtCBM
_pkgver=1.1.0
url="https://github.com/mveinot/QtCBM"
license=('GPLv2')
groups=()
depends=('qt5-base' 'opencbm-git')
makedepends=('imagemagick')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/mveinot/QtCBM.git"
         "git+https://github.com/qtproject/qt-solutions.git")
noextract=()

md5sums=('SKIP'
         'SKIP')


prepare() {
  cd "$srcdir/${_pkgname}"
  patch -p1 < ../../0001-add-missing-include.patch
}

build() {
  cd "${srcdir}/${_pkgname}"
  make -C diskimage -f Makefile.unix
  qmake
  make

  # convert ico to png
  convert QtCBM.ico qtcbm.png
}

check() {
  cd "${srcdir}/${_pkgname}"
  make -k check
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="${pkgdir}/" install
  install -Dm0755 ${_pkgname} "$pkgdir/usr/bin/qtcbm"
  install -Dm0755 qtcbm-1.png "$pkgdir/usr/share/pixmaps/qtcbm.png"
  install -Dm0755 ../../qtcbm.desktop "$pkgdir/usr/share/applications/qtcbm.desktop"
}

# EOF
