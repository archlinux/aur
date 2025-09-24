pkgname=imgui
# On each update, keep up to date with latest sha in https://github.com/microsoft/vcpkg/commits/master/ports/imgui
_vcpkg_sha=16601c6e7ee15aeccac771185916cd6f6fe1ba50
pkgver=1.92.3
pkgrel=1
pkgdesc="Bloat-free Graphical User interface for C++"
license=('MIT')
arch=('x86_64')
url="https://github.com/ocornut/imgui"
depends=('gcc-libs')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/ocornut/imgui/tar.gz/v${pkgver}"
        "CMakeLists.v${pkgver}-${pkgrel}.txt::https://raw.githubusercontent.com/microsoft/vcpkg/${_vcpkg_sha}/ports/imgui/CMakeLists.txt"
        "imgui-config.v${pkgver}-${pkgrel}.cmake.in::https://raw.githubusercontent.com/microsoft/vcpkg/${_vcpkg_sha}/ports/imgui/imgui-config.cmake.in")
sha256sums=('9212ee7c4718b1466a5d99e64bce3ef1965704afea4ba651f8d978d0791b7c7c'
            '469172229e8a2e6ddb00105c4a764fa452ab143d21edd0b30cea589bf0b75191'
            '2a441c1709b0ec7c0de1f403944ba5b8d8c059c02adcea9f8550bf33303eb7bb')

prepare () {
  cp CMakeLists.v${pkgver}-${pkgrel}.txt        ${pkgname}-${pkgver}/CMakeLists.txt
  cp imgui-config.v${pkgver}-${pkgrel}.cmake.in ${pkgname}-${pkgver}/imgui-config.cmake.in
}

build() {
  cd $pkgname-$pkgver
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=ON \
    -S. \
    -B cmake-build-shared
  cmake --build cmake-build-shared
}

package() {
  cd $pkgname-$pkgver
  make -C cmake-build-shared DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
