# Maintainer: Benjamin Chretien <chretien at lirmm dot fr>
pkgname=choreonoid
pkgver=1.7.0
pkgrel=1
pkgdesc="An integrated robotics GUI environment."
arch=('any')
url="http://choreonoid.org"
license=('LGPL2')
depends=('boost' 'bullet' 'eigen3' 'glew' 'glibc' 'libgl' 'libpng' 'libjpeg-turbo'
         'libyaml' 'libx11' 'openscenegraph' 'qt4' 'zlib')
makedepends=('cmake')

source=(https://choreonoid.org/_downloads/$pkgname-${pkgver}.zip)
sha512sums=('bb33deb63ecb23adde035665514799d86c38d0af8d24affbc1f63df39bb107f34e5d2899b48a95daf040f8fdd926a5f21941043c670665715c3a06388fab6855')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  mkdir -p build && cd build
  cmake .. -DCMAKE_BUILD_TYPE="Release" -DCMAKE_INSTALL_PREFIX="/usr" \
           -DINSTALL_SDK:BOOL=TRUE \
           -DINSTALL_RUNTIME_DEPENDENCIES:BOOL=TRUE \
           -DCNOID_ENABLE_GETTEXT:BOOL=TRUE \
           -DUSE_EXTERNAL_YAML:BOOL=TRUE \
           -DUSE_EXTERNAL_GLEW:BOOL=TRUE \
           -DBUILD_BULLET_PLUGIN:BOOL=TRUE
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  cd build
  make DESTDIR="${pkgdir}/" install
}
