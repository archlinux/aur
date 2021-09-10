# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

_pkgname=plasma-applet-server-status
pkgname=plasma5-applets-server-status-git
pkgver=r5.639b183
pkgrel=1
pkgdesc="Applet for KDE Plasma 5 showing a status of the servers defined by user."
arch=("any")
url="https://github.com/MakG10/plasma-applet-server-status"
license=('GPL3')
makedepends=('git' 'cmake' 'extra-cmake-modules' 'plasma-framework')
provides=("plasma5-applets-server-status")
conflicts=("plasma5-applets-server-status")
source=('git+https://github.com/MakG10/plasma-applet-server-status.git')
sha512sums=('SKIP')

pkgver() {
  cd $srcdir/$_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $srcdir/$_pkgname
  mkdir -p build && cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd $srcdir/$_pkgname/build
  make DESTDIR="$pkgdir/" install
}
