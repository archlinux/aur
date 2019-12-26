# Maintainer: Roberto Hueso < robertohueso96 at gmail dot com >
pkgname=ensmallen
pkgver=2.11.0
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
  'cmake>=2.8.10'
)
source=("https://ensmallen.org/files/${pkgname}-${pkgver}.tar.gz")
sha256sums=('6837410bbc77c428c2cba305244bda2a68521b3b4c1d423ecae8f0d464bcedb1')
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
