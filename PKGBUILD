# Maintainer: Peter Mattern <pmattern at arcor dot de>

_pkgname=lxqt-build-tools
pkgname=$_pkgname-git
pkgver=r200.46d8398
pkgrel=1
pkgdesc='Tools to build LXQt and components maintained by the project.'
arch=('any')
url='https://github.com/lxde/lxqt-build-tools'
license=('LGPL')
makedepends=('git' 'cmake' "qt5-"{base,tools,x11extras} 'libqtxdg-git' 'kwindowsystem')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/lxde/lxqt-build-tools.git#branch=make-it-work")
sha256sums=("SKIP")

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  rm -Rf build ; mkdir build
  cd build
  cmake $srcdir/$_pkgname -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
