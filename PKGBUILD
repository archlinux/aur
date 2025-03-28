# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
pkgname=vinecopulib
pkgver=0.7.2
pkgrel=1
pkgdesc="C++ vine copula library"
license=(MIT)
arch=(x86_64)
url="https://github.com/${pkgname}/${pkgname}"
depends=(gcc-libs)
makedepends=(cmake eigen boost libwdm r)
provides=("lib${pkgname}.so")
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('69b41678dabc1ed395785c8020f77480c45724a26033a65159726236c9e829a8aaae7a915a3fa64263ff6f020dccc382b7ed9507618f1fb006f0f38db591dc14')

build() {
  cmake \
    -S ${pkgname}-${pkgver} \
    -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=TRUE \
    -DCMAKE_CXX_STANDARD=11 \
    -DCMAKE_CXX_COMPILER=g++ \
    -DBUILD_TESTING=OFF \
    -DOPT_ASAN=ON \
    -DVINECOPULIB_SHARED_LIB=ON \
    -DWARNINGS_AS_ERRORS=OFF \
    -Wno-dev
  cmake --build build --target all
}

package() {
  DESTDIR="${pkgdir}" cmake --build build --target install
  install -Dm644 "${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
