# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: xiota <aur@mentalfossa.com>
# Contributor: Michel Zou <xantares09@hotmail.com>
pkgname=cpp-peglib
pkgdesc="A single file C++ header-only PEG (Parsing Expression Grammars) library"
pkgver=1.10.3
pkgrel=1
license=(MIT)
arch=(any)
url="https://github.com/yhirose/${pkgname}"
makedepends=(cmake)
checkdepends=(gtest)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('4a33218fb403f1bac11de36e2e5705572ead07e7f5d86252febfae65946f538b6c11473cc12cf06d81108657dee490ac634286c477a2e9cb185ad4b0a0beca02')

build() {
  cmake \
    -S ${pkgname}-${pkgver} \
    -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTS=ON \
    -DFETCHCONTENT_FULLY_DISCONNECTED=OFF \
    -DINSTALL_GTEST=OFF \
    -Wno-dev
  cmake --build build --target all
}

check() {
  ctest --test-dir build
}

package() {
  DESTDIR="${pkgdir}" cmake --build build --target install
  install -Dm644 ${pkgname}-${pkgver}/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
