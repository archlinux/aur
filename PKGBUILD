# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: xiota <aur@mentalfossa.com>
# Contributor: Michel Zou <xantares09@hotmail.com>
pkgname=cpp-peglib
pkgdesc="A single file C++ header-only PEG (Parsing Expression Grammars) library"
pkgver=1.13.0
pkgrel=1
license=(MIT)
arch=(any)
url="https://github.com/yhirose/${pkgname}"
makedepends=(cmake)
checkdepends=(gtest)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('0a1c2e2105bac6d5de33626a26ca618ba91c59189f324fc02b46a7a063eb426832ef86cbd06dc8a67eacb02326572070f8b1d22ccf4b1147c8fea0c444069d9d')

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
