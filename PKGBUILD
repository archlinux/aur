# Maintainer: TheAifam5 <theaifam5 at gmail com>

pkgname=sol2-git
pkgver=v3.0.2.r1.ge256012d
pkgrel=1
pkgdesc="C++ <-> Lua Wrapper Library"
arch=('any')
url="http://sol2.rtfd.io/"
license=('MIT')
makedepends=('git' 'cmake' 'python' 'python-sphinx')
optdepends=('lua' 'lua51' 'lua52' 'luajit')
conflicts=('sol2')
provides=('sol2')
source=('sol2::git+https://github.com/ThePhD/sol2.git')
md5sums=('SKIP')

pkgver() {
  cd sol2
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd sol2
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
  cd sol2/build
  make DESTDIR="$pkgdir" install
}
