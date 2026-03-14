# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: xiota <aur@mentalfossa.com>
# Contributor: Michel Zou <xantares09@hotmail.com>
pkgname=cpp-peglib
pkgdesc="A single file C++ header-only PEG (Parsing Expression Grammars) library"
pkgver=1.10.1
pkgrel=1
license=(MIT)
arch=(any)
url="https://github.com/yhirose/${pkgname}"
makedepends=(cmake)
checkdepends=(gtest)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('5ba9bf9870830c85d1e18fd463088f8f35a850fcaacc2f73bd926ed38246f3d5724589949e11dbb6056d995d6e9729d82a588e40ee18fe85c9343920a379c0a2')

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
