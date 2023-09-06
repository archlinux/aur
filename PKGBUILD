pkgname=imgui
pkgver=1.89.9
pkgrel=2
pkgdesc="Bloat-free Graphical User interface for C++"
license=('MIT')
arch=('x86_64')
url="https://github.com/ocornut/imgui"
depends=('gcc-libs')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/ocornut/imgui/tar.gz/v${pkgver}"
        "CMakeLists.v${pkgver}-${pkgrel}.txt::https://raw.githubusercontent.com/microsoft/vcpkg/master/ports/imgui/CMakeLists.txt"
        "imgui-config.v${pkgver}-${pkgrel}.cmake.in::https://raw.githubusercontent.com/microsoft/vcpkg/master/ports/imgui/imgui-config.cmake.in")
sha256sums=('1acc27a778b71d859878121a3f7b287cd81c29d720893d2b2bf74455bf9d52d6'
            'd91c95d73bcf3d8f2a05d15394a1a6600a91df6f5dee99cc467a548ee8f05a1f'
            '1e7b523fca4b85ef4bd995c8c0485ba15be78d91731f6a5a444711762b947493')

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
