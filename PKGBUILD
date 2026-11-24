# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=jwt-cpp
pkgver=0.7.3
pkgrel=1
pkgdesc='A header only library for creating and validating JSON Web Tokens in C++'
arch=(any)
url='https://github.com/Thalhammer/jwt-cpp/'
license=('MIT')
makedepends=(
  cmake
  gtest
  nlohmann-json
)
options=(!debug)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Thalhammer/jwt-cpp/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d24f49f05e18f283935f511af0f62f73a042d512123a1865a8ce929f56a52735')

build() {
  cd "${pkgname}-${pkgver}"

  cmake -S . -B build \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DJWT_CMAKE_FILES_INSTALL_DIR='/usr/lib/cmake' \
    -DJWT_BUILD_TESTS=OFF \
    -DJWT_BUILD_EXAMPLES=OFF
  cmake --build build
}

# check() {
#   cd "${pkgname}-${pkgver}"
#
#   ./build/tests/jwt-cpp-test
#   # ctest --test-dir build/tests --output-on-failure
# }

package() {
  cd "${pkgname}-${pkgver}"

  DESTDIR="${pkgdir}" cmake --install build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # # Handle files in incorrect directory
  # install -dm755 ${pkgdir}/usr/lib/cmake
  # mv "${pkgdir}/usr/cmake/jwt-cpp-config-version.cmake" "${pkgdir}/usr/lib/cmake/jwt-cpp-config-version.cmake"
  # mv "${pkgdir}/usr/cmake/jwt-cpp-config.cmake" "${pkgdir}/usr/lib/cmake/jwt-cpp-config.cmake"
  # mv "${pkgdir}/usr/cmake/jwt-cpp-targets.cmake" "${pkgdir}/usr/lib/cmake/jwt-cpp-targets.cmake"
  # rm -rf "${pkgdir}/usr/cmake"
}
