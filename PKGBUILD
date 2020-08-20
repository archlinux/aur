# Maintainer: blacktea <blackteahamburger@outlook.com>

pkgname=adios2-git
pkgver=2.6.0.r256.gd96750bf
pkgrel=4
pkgdesc="Next generation of ADIOS developed in the Exascale Computing Program"
arch=('x86_64')
url="https://adios2.readthedocs.io/en/latest/index.html"
license=('Apache')
depends=('libpng' 'zfp' 'hdf5' 'zeromq' 'libfabric' 'blosc' 'python' 'sz')
makedepends=('cmake' 'git')
provides=('adios2')
conflicts=('adios2')
source=('adios2-git::git+https://github.com/ornladios/ADIOS2.git')
md5sums=('SKIP')

pkgver() {
  cd $pkgname/
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $pkgname/
  mkdir -p build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_SKIP_INSTALL_RPATH=ON \
        -DADIOS2_BUILD_TESTING=OFF \
        -DADIOS2_BUILD_EXAMPLES=OFF \
        ..
  make
}

package() {
  cd $pkgname/
  make DESTDIR="$pkgdir" install
}
