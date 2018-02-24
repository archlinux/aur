pkgname=sdformat
pkgver=6.0.0
pkgrel=3
pkgdesc="SDF Converter for gazebo"
arch=('i686' 'x86_64')
url="http://sdformat.org/"
license=('Apache')
depends=('boost' 'tinyxml' 'ignition-math>=4' 'ignition-math<5' 'python-psutil')
makedepends=('cmake' 'doxygen' 'ruby>=1.9.1')

source=("http://osrf-distributions.s3.amazonaws.com/${pkgname}/releases/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('93ea8007e9d92c87f99240e378231977fb1de2072fd752449f65917cb430bc4d')

prepare(){
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p build && cd build

  cmake .. -DCMAKE_BUILD_TYPE="Release" \
           -DCMAKE_INSTALL_PREFIX=/usr \
           -DCMAKE_INSTALL_LIBDIR=lib
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make
}

# check() {
#   cd "${srcdir}/${pkgname}-${pkgver}/build"
#   make test
# }

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make DESTDIR="$pkgdir/" install
}
