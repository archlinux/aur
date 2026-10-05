# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: xiota <aur@mentalfossa.com>
# Contributor: Michel Zou <xantares09@hotmail.com>
pkgname=cpp-peglib
pkgdesc="A single file C++ header-only PEG (Parsing Expression Grammars) library"
pkgver=1.20.0
pkgrel=1
license=(MIT)
arch=(any)
url="https://github.com/yhirose/${pkgname}"
makedepends=(cmake)
checkdepends=(gtest)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('ca66d081745937a2d1155f7583ccc928754d13118621b07d69930c6b5f8c2342af21e98c1cb8bd8abce125467208b0c7c3abc223e7e9e23f9cf229b12274e389')

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
