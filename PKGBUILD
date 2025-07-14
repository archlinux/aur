# Maintainer: Your Name <youremail@domain.com>
pkgname=z5-git
_pkgname=z5
pkgver=0.1.0
pkgrel=1
pkgdesc="A C++ library for chunked n-dimensional arrays."
arch=('x86_64')
url="https://github.com/constantinpape/z5"
license=('MIT')
depends=('blosc' 'zlib' 'bzip2' 'xz' 'lz4' 'xtensor' 'nlohmann-json' 'python-pybind11' 'python-xtensor' 'python-numpy')
makedepends=('git' 'cmake')
optdepends=('aws-sdk-cpp: for S3 support'
            'gcs-client-cpp: for GCS support')
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