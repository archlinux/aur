# Maintainer: Roberto Hueso < robertohueso96 at gmail dot com >
pkgname=ensmallen
pkgver=2.12.1
pkgrel=1
pkgdesc='Flexible C++ library for efficient mathematical optimization'
arch=('x86_64')
url="https://ensmallen.org/"
license=('BSD')
depends=(
  'armadillo>=8.400.0'
  'lapack'
)

optdepends=(
  'openmp: parallel computation support'
)

makedepends=(
  'cmake>=3.3.2'
)
source=("https://ensmallen.org/files/${pkgname}-${pkgver}.tar.gz")
sha256sums=('e91a7053b2db055c41c981753ce3aeb1afaabd10370a8c541ec04e1f4d07d964')
options=(!emptydirs)

prepare() {
  cd "${pkgname}-${pkgver}"
  mkdir -p build
}

build() {
  cd "${pkgname}-${pkgver}/build"

  cmake \
      -D CMAKE_INSTALL_PREFIX="/usr" \
      -D BUILD_TESTS=OFF \
      -D USE_OPENMP=ON \
      ..
  make
}

package() {
  cd "${pkgname}-${pkgver}/build"

  make DESTDIR="$pkgdir" install

  install -m 755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m 644 ../LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}"
}
