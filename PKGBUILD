# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=ignition-gui
pkgver=4.0.0
pkgrel=1
pkgdesc="Builds on top of Qt to provide widgets which are useful when developing
robotics applications, such as a 3D view, plots, dashboard, etc, and can be used
together in a convenient unified interface."
arch=('x86_64')
url="https://ignitionrobotics.org/libs/gui"
license=('Apache')
depends=()
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ignitionrobotics/ign-gui/archive/${pkgname}4_${pkgver}.tar.gz")
sha256sums=('17de4b5c84ee272075da1c8ef57d9e8b761e9b6941f711ca07602b28011c681d')

_dir="ign-gui-${pkgname}4_${pkgver}"

build() {
  cd "$srcdir/$_dir"

  mkdir -p build
  cd build

  # Configure build
  cmake .. -DCMAKE_BUILD_TYPE="Release" \
           -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" \
           -DCMAKE_INSTALL_LIBDIR="lib" \
           -DBUILD_TESTING=OFF

  # Compile
  make
}

package() {
  cd "$srcdir/$_dir/build"
  #make DESTDIR="$pkgdir/" install
  make install
}
