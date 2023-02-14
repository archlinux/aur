pkgname=imgui
pkgver=1.89.3
pkgrel=1
pkgdesc="Bloat-free Graphical User interface for C++"
license=('MIT')
arch=('x86_64')
url="https://github.com/ocornut/imgui"
depends=('gcc-libs')
makedepends=('cmake')
source=("https://codeload.github.com/ocornut/imgui/tar.gz/v${pkgver}"
        "https://raw.githubusercontent.com/microsoft/vcpkg/master/ports/imgui/CMakeLists.txt"
        "https://raw.githubusercontent.com/microsoft/vcpkg/master/ports/imgui/imgui-config.cmake.in") 
sha256sums=('3b665fadd5580b7ef494d5d8bb1c12b2ec53ee723034caf43332956381f5d631'
            '262faed507149c89aab7572fd2c2a968f843ca2900043e30a9c339735ed08a8f'
            '91528f60cca93d3bce042d2ac16a63169025ec25a34453b49803126ed19153ae')

prepare () {
  cp CMakeLists.txt imgui-config.cmake.in $pkgname-$pkgver
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
