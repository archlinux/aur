pkgname=sdformat
pkgver=3.1.1
pkgrel=4
pkgdesc="SDF Converter for gazebo"
arch=('i686' 'x86_64')
url="http://sdformat.org/"
license=('Apache')
depends=('boost' 'tinyxml' 'ignition-math>=2')
makedepends=('cmake' 'doxygen' 'ruby>=1.9.1')

source=("http://osrf-distributions.s3.amazonaws.com/${pkgname}/releases/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('ffeb64a05ffd3dd6de1f25bdfe716eb9f61cde6c96d5060fb6dd740c6b875657')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  mkdir -p build && cd build

  cmake .. -DCMAKE_BUILD_TYPE="Release" \
           -DCMAKE_INSTALL_PREFIX=/usr \
           -DCMAKE_INSTALL_LIBDIR=lib

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"

  make DESTDIR="$pkgdir/" install
}
