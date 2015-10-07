# Maintainer: Manuel Schneider  <manuelschneid3r at googles mail>
pkgname_=albert
pkgname=${pkgname_}-git
pkgver=0.7.2.r0.g11e40cf
pkgrel=1
pkgdesc="A DE agnostic omnilauncher."
arch=('i686' 'x86_64')
url="https://github.com/ManuelSchneid3r/${pkgname_}"
license=('GPL')
depends=('qt5-base' 'libx11' 'muparser' 'qt5-x11extras' 'qt5-svg')
makedepends=('git' 'cmake' 'qt5-base' 'qt5-tools')
provides=("${pkgname_}")
conflicts=("${pkgname_}")
source=("git+${url}")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname_"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  [[ -d "${pkgname_}/build" ]] || mkdir "${pkgname_}/build"
  cd "${pkgname_}/build"
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "${pkgname_}/build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:



