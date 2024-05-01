# Maintainer: Kino <cybao292261 at 163 dot com>

pkgname=sophus
_pkgname=Sophus
pkgver=1.22.10
pkgrel=2
pkgdesc="C++ implementation of Lie Groups using Eigen"
arch=('x86_64' 'i686')
url="https://strasdat.github.io/Sophus/latest"
license=('MIT')
depends=('eigen' 'fmt')
makedepends=('cmake')
checkdepends=('ceres-solver')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/strasdat/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('eb1da440e6250c5efc7637a0611a5b8888875ce6ac22bf7ff6b6769bbc958082')

build() {
  cmake -B build -S "${_pkgname}-${pkgver}" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_SOPHUS_TESTS=ON \
        -DBUILD_SOPHUS_EXAMPLES=OFF
  cmake --build build
}

check() {
  cd build
  ctest --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 ${srcdir}/${_pkgname}-${pkgver}/LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
