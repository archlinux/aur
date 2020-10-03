# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

_pkgname=isoimagewriter
pkgname=$_pkgname-git
pkgver=0.8.r21.g081a939
pkgrel=1
pkgdesc="Tool to write a .iso file to a USB disk"
arch=("x86_64" "i686")
url="https://community.kde.org/ISOImageWriter"
license=('GPL3')
depends=('ki18n' 'kauth' 'kwidgetsaddons' 'kiconthemes' 'kcrash' 'qgpgme')
makedepends=('git' 'cmake' 'extra-cmake-modules' 'python')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(git+https://invent.kde.org/utilities/isoimagewriter.git)
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$_pkgname -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DKDE_INSTALL_LIBDIR=lib
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir/" install
}
