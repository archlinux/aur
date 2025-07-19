# Maintainer: Hendrik Schilling <hendrik.schilling@posteo.de>
pkgname=z5-git
_pkgname=z5
pkgver=2.0.20.r0.g7df1d21
pkgrel=1
provides=("${_pkgname}")
pkgdesc="A C++ library for chunked n-dimensional arrays."
arch=('x86_64')
url="https://github.com/constantinpape/z5"
license=('MIT')
depends=('blosc' 'zlib' 'bzip2' 'xz' 'lz4' 'xtensor' 'nlohmann-json')
makedepends=('git' 'cmake')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  mkdir build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
           -DBUILD_Z5PY=OFF \
           -DWITH_BLOSC=ON \
           -DWITH_ZLIB=ON \
           -DWITH_BZIP2=ON \
           -DWITH_LZ4=ON \
           -DWITH_XZ=ON
  make
}

package() {
  cd "$_pkgname/build"
  make install DESTDIR="$pkgdir/"
}
