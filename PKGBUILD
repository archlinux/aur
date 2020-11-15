
pkgname='xdmf-git'
pkgver=3.0.r2461.04a84bab
pkgrel=1
pkgdesc="eXtensible Data Model and Format"
arch=('i686' 'x86_64')
url="http://www.xdmf.org"
license=('BSD')
depends=('hdf5' 'libxml2' 'libtiff')
makedepends=('cmake' 'boost' 'doxygen')
provides=('xdmf')
conflicts=('xdmf')
source=("git+https://gitlab.kitware.com/xdmf/xdmf.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/xdmf"
  printf "3.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd xdmf
  mkdir -p build && cd build
  cmake \
    -DBUILD_SHARED_LIBS=ON \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DXDMF_BUILD_DOCUMENTATION=ON \
    -DXDMF_BUILD_TESTING=OFF \
    -DXDMF_BUILD_UTILS=ON \
    -DXDMF_WRAP_PYTHON=OFF \
    -Wno-dev \
    ..
  make
}

package() {
  cd xdmf/build
  make DESTDIR="$pkgdir/" install
}
