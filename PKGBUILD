# Maintainer: Grey Christoforo <first name at last name dot net>
pkgname=heekscnc-git
pkgver=1139.ece2f41
pkgrel=2
pkgdesc="CAM add-on for HeeksCAD"
arch=('x86_64')
url="http://heeks.net"
license=('custom:BSD3')
depends=('heekscad-git')
makedepends=('git' 'cmake')
source=('heekscnc-git::git://github.com/Heeks/heekscnc.git')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  #echo $(git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g')
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  msg "Starting build..."
  export CASROOT=/opt/opencascade
  cd "${srcdir}/${pkgname}"
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
}

package() {
  cd "$srcdir/${pkgname}/build"
  make DESTDIR="$pkgdir/" install
}
