# Maintainer: Anton T Johansson <anton@tetov.se>
# Contributor: GPereira
# Contributor: Jelle van der Waa <jelle@archlinux.org>
# Contributor: Grey Christoforo <first name [at] last name [dot] net>

pkgname=curaengine-beta-git
pkgver=r6631.d9a326d2
pkgrel=1
pkgdesc="Engine for processing 3D models into 3D printing instruction for Ultimaker and other GCode based 3D printers."
arch=('x86_64')
url="https://github.com/Ultimaker/CuraEngine"
license=('AGPL')
depends=('arcus-beta-git')
# Below TODO from curaengine in community
# TODO: https://github.com/Ultimaker/CuraEngine/blob/master/CMakeLists.txt#L26
# Package polyclipping in the repos
makedepends=('cmake' 'git')
checkdepends=('cppunit')
provides=('curaengine')
conflicts=('curaengine')
source=("git+${url}#branch=4.0")
md5sums=('SKIP')

pkgver(){
  cd CuraEngine
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
  cd CuraEngine
  mkdir -p build
  cd build

   cmake .. \
     -DCMAKE_INSTALL_PREFIX=/usr \
     -DBUILD_TESTS=ON \
     -DCMAKE_BUILD_TYPE=Release

  make
}

check() {
  cd CuraEngine/build
  make test
}

package() {
  cd CuraEngine/build
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
