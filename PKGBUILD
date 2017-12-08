pkgname=sdformat
pkgver=5.3.0
pkgrel=1
pkgdesc="SDF Converter for gazebo"
arch=('i686' 'x86_64')
url="http://sdformat.org/"
license=('Apache')
depends=('boost' 'tinyxml' 'ignition-math>=3', 'python-psutil')
makedepends=('cmake' 'doxygen' 'ruby>=1.9.1')

source=("http://osrf-distributions.s3.amazonaws.com/${pkgname}/releases/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('e5946e84431cf7874cf422d5b5a9f34f42b31d82b5baea532d1e466011bd89e0')

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
