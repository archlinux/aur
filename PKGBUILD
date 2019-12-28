# Maintainer: Roberto Hueso < robertohueso96 at gmail dot com >
pkgname=ensmallen
pkgver=2.11.1
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
sha256sums=('c1343f4a61817a396866e497912cc3cd918600c4778869ce8a4f46a5474b980b')
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
