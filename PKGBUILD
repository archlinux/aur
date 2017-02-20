# Maintainer: Grey Christoforo <first name at last name dot net>
pkgname=heekscnc-git
pkgver=1143.8c70474
pkgrel=4
pkgdesc="CAM add-on for HeeksCAD"
arch=('x86_64')
url="http://heeks.net"
license=('custom:BSD3')
depends=('heekscad-git')
makedepends=('cmake')
source=('git://github.com/Heeks/heekscnc.git')
provides=('heekscnc')
conflicts=('heekscnc')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/heekscnc"
  #echo $(git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g')
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  cd "${srcdir}/heekscnc"
}

build() {
  msg "Starting build..."
  export CASROOT=/opt/opencascade
  cd "${srcdir}/heekscnc"
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
}

package() {
  cd "$srcdir/heekscnc/build"
  make DESTDIR="$pkgdir/" install

  mkdir -p "${pkgdir}/usr/share/licenses"
  cp "${srcdir}/heekscnc/COPYING" "${pkgdir}/usr/share/licenses/$pkgname"
}
