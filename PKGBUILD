
pkgname='xdmf-git'
pkgver=r2384.605db515
pkgrel=1
pkgdesc="eXtensible Data Model and Format"
arch=('i686' 'x86_64')
url="http://www.xdmf.org"
license=('BSD')
depends=('hdf5' 'libxml2' 'libtiff')
makedepends=('cmake' 'boost')
provides=('xdmf')
conflicts=('xdmf')
source=("git+git://xdmf.org/Xdmf.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/Xdmf"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd Xdmf
}

build() {
  cd Xdmf
  mkdir -p build && cd build
  cmake \
    -DBUILD_SHARED_LIBS=ON \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    ..
  make
}

package() {
  cd Xdmf/build
  make DESTDIR="$pkgdir/" install
}
