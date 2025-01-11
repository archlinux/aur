# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
pkgname=vinecopulib
pkgver=0.7.0
pkgrel=1
pkgdesc="C++ vine copula library"
license=(MIT)
arch=(x86_64)
url="https://github.com/${pkgname}/${pkgname}"
depends=(gcc-libs)
makedepends=(cmake eigen boost libwdm r)
provides=("lib${pkgname}.so")
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('ebe03ef72600ba666b775d33af596c584990dd0fb16fd4dae1f115fbbb6ed889fcc8a4b2fefda33fa212d969b9eeae20c615432123ff4923b720f5ebb287efef')

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
