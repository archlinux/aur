# Maintainer: TheAifam5 <theaifam5 at gmail com>

_pkgver=3.0.2
pkgname=sol2
pkgver=v${_pkgver}
pkgrel=1
pkgdesc="C++ <-> Lua Wrapper Library"
arch=('any')
url="http://sol2.rtfd.io/"
license=('MIT')
makedepends=('git' 'cmake' 'python' 'python-sphinx')
optdepends=('lua' 'lua51' 'lua52' 'luajit')
conflicts=('sol2')
provides=('sol2')
source=("https://github.com/ThePhD/sol2/archive/$pkgver.tar.gz")
sha256sums=('6265ade1efd5b1133d71fa3b81fd0214ccf964992a8cbab3dfae650a00ed0258')

build() {
  cd "$pkgname-$_pkgver"
  rm -rf build
  mkdir build
  cd build
  cmake .. -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DCMAKE_INSTALL_LIBEXECDIR=/usr/lib \
    -DSOL2_BUILD_LUA=OFF \
    -DSOL2_GENERATE_SINGLE=ON \
    -DBUILD_LUA_AS_DLL=OFF
  make
}

package() {
  cd "$pkgname-$_pkgver/build"
  make DESTDIR="$pkgdir" install
}
