# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Jitang Zheng <jitang dot zheng at gmail dot com>

pkgname=google-fruit
pkgver=3.4.0
pkgrel=1
pkgdesc="Fruit, a dependency injection framework for C++."
arch=('x86_64' 'i686')
url="https://github.com/google/fruit"
license=('Apache')
depends=('gcc-libs')
makedepends=('boost' 'cmake')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/google/fruit/archive/v${pkgver}.tar.gz")
sha256sums=('0f3793ee5e437437c3d6360a037866429a7f1975451fd60d740f9d2023e92034')

build() {
  mkdir -p "${srcdir}/build" && cd "${srcdir}/build"
  cmake \
    -DBUILD_SHARED_LIBS=on \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DFRUIT_USES_BOOST=on \
    ../fruit-${pkgver}

  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install
}
