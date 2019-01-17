# Maintainer: Anton T Johansson <anton@tetov.se>
# Contributor: GPereira
# Contributor: Jelle van der Waa <jelle@archlinux.org>
# Contributor: Grey Christoforo <first name [at] last name [dot] net>

pkgname=curaengine-beta-git
pkgver=4.0
pkgrel=1
pkgdesc="Engine for processing 3D models into 3D printing instruction for Ultimaker and other GCode based 3D printers."
url="https://github.com/Ultimaker/CuraEngine"
arch=('x86_64')
license=('AGPL')
depends=('arcus-beta-git')
# Below TODO from curaengine in community
# TODO: https://github.com/Ultimaker/CuraEngine/blob/master/CMakeLists.txt#L26
# Package polyclipping in the repos
checkdepends=('cppunit')
makedepends=('cmake' 'git')
source=("git+https://github.com/Ultimaker/curaengine#branch=${pkgver}")
conflicts=('curaengine' 'curaengine-git')
sha256sums=('SKIP')

build() {
  cd curaengine
  mkdir -p build
  cd build
 
   cmake .. \
     -DCMAKE_INSTALL_PREFIX=/usr \
     -DBUILD_TESTS=ON \
     -DCMAKE_BUILD_TYPE=Release

  make
}

check() {
  cd curaengine/build
  make test
}

package() {
  cd curaengine/build
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
