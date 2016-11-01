# Maintainer: Grey Christoforo <first name at last name dot net>
pkgname=heekscad-git
pkgver=1447.d6a3e96
pkgrel=2
pkgdesc="HeeksCNC is an open source, 3D CAD/CAM software"
arch=('x86_64')
url="http://heeks.net"
license=('custom:BSD3')
depends=('python' 'opencascade' 'wxgtk2.8' 'libarea-git')
makedepends=('git' 'cmake')
source=('heekscad-git::git://github.com/Heeks/heekscad.git')
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
