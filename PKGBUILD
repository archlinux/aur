pkgname=imgui
pkgver=1.89.7
pkgrel=1
pkgdesc="Bloat-free Graphical User interface for C++"
license=('MIT')
arch=('x86_64')
url="https://github.com/ocornut/imgui"
depends=('gcc-libs')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/ocornut/imgui/tar.gz/v${pkgver}"
        "CMakeLists.v${pkgver}-${pkgrel}.txt::https://raw.githubusercontent.com/microsoft/vcpkg/master/ports/imgui/CMakeLists.txt"
        "imgui-config.v${pkgver}-${pkgrel}.cmake.in::https://raw.githubusercontent.com/microsoft/vcpkg/master/ports/imgui/imgui-config.cmake.in")
sha256sums=('115ee9e242af98a884302ac0f6ca3b2b26b1f10c660205f5e7ad9f1d1c96d269'
            '9435b199b0248611314f312e0ac9130816d86f2b15ac21283cffb78d883d5584'
            'b993a4e2cd0729586339816aabebb0d0109a390c4beb65e7319dba8bd940c28a')

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
