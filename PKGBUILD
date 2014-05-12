# Maintainer: Benjamin Chretien <chretien at lirmm dot fr>
pkgname=choreonoid
pkgver=1.4.0
pkgrel=1
pkgdesc="An integrated robotics GUI environment."
arch=('any')
url="http://choreonoid.org"
license=('LGPL2')
depends=('boost' 'bullet' 'eigen3' 'glew' 'glibc' 'libgl' 'libpng' 'libjpeg-turbo'
         'libyaml' 'libx11' 'qt4' 'zlib')
makedepends=('cmake')

source=(http://choreonoid.org/_downloads/$pkgname-${pkgver}.zip)
md5sums=('e56e98cc33effbfbcbdb7e3ab4153fc3')

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
