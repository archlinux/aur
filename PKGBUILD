# Maintainer: Roberto Hueso < roberto at robertohueso dot org >
pkgname=ensmallen
pkgver=2.17.0
pkgrel=1
pkgdesc='Flexible C++ library for efficient mathematical optimization'
arch=('x86_64')
url="https://ensmallen.org/"
license=('BSD')
depends=(
  'armadillo>=9.800.0'
  'lapack'
)

optdepends=(
  'openmp: parallel computation support'
)

makedepends=(
  'cmake>=3.3.2'
)
source=("https://ensmallen.org/files/${pkgname}-${pkgver}.tar.gz")
sha256sums=('2803c8cce58f278d6e7eb4a5d8090da10b4cce7a5c6c6e6f65e89de4fc9c9086')
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
