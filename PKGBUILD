# Maintainer: Peter Mattern <pmattern at arcor dot de>

_pkgname=featherpad
pkgname=$_pkgname-git
pkgver=r33.a89933d
pkgrel=1
pkgdesc='Lightweight Qt5 plain text editor for Linux'
arch=('i686' 'x86_64')
url='https://github.com/tsujan/FeatherPad'
license=('GPL3')
depends=('qt5-svg' 'qt5-x11extras' 'desktop-file-utils' 'gtk-update-icon-cache')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/tsujan/FeatherPad.git")
sha256sums=("SKIP")

pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  rm -Rf build && mkdir build
  cd build
  qmake $srcdir/$_pkgname/ CONFIG+=debug
  make
}

package() {
  cd build
  make INSTALL_ROOT=$pkgdir install
}
