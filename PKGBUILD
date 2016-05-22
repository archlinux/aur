# Maintainer: Kiril Zyapkov <kiril.zyapkov at gmail>
pkgname=heekscad-git
pkgver=1441.2254f21
pkgrel=1
pkgdesc="Library and python module for pocketing and profiling operations"
arch=('x86_64')
url="https://github.com/Heeks/libarea"
license=('custom:BSD3')
depends=('python' 'opencascade' 'wxgtk2.8' 'libarea')
makedepends=('git' 'cmake')
provides=('heekscad')
source=('heekscad-git::git://github.com/Heeks/heekscad.git#branch=oce-0.17')
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
