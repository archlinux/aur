# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: xiota <aur@mentalfossa.com>
# Contributor: Michel Zou <xantares09@hotmail.com>
pkgname=cpp-peglib
pkgdesc="A single file C++ header-only PEG (Parsing Expression Grammars) library"
pkgver=1.25.0
pkgrel=1
license=(MIT)
arch=(any)
url="https://github.com/yhirose/${pkgname}"
makedepends=(cmake)
checkdepends=(gtest)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('414ffa49f89b4c0ec66fee9994d921c8ddd6e164e37c28c605d709c19ecdcc5f21803a250eaaa21f4744c1e9ff3c2289a431761732752f613b3dad2f22f7c119')

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
