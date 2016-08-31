# Maintainer: Peter Mattern <pmattern at arcor dot de>

_pkgname='pavucontrol-qt'
pkgname="$_pkgname-git"
pkgver=r440.a88951b
pkgrel=1
pkgdesc='Qt port of pavucontrol'
arch=('i686' 'x86_64')
url='https://github.com/lxde/pavucontrol-qt'
license=('GPL2')
depends=('libpulse' 'glibmm' 'qt5-base')
makedepends=('git' 'cmake' 'qt5-tools' 'liblxqt-git' 'xdg-user-dirs')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/lxde/pavucontrol-qt.git")
sha256sums=("SKIP")

pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  rm -Rf build ; mkdir build ; cd build
  cmake $srcdir/$_pkgname \
          -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR=$pkgdir install
}
