pkgname=imgui
pkgver=1.89.5
pkgrel=3
pkgdesc="Bloat-free Graphical User interface for C++"
license=('MIT')
arch=('x86_64')
url="https://github.com/ocornut/imgui"
depends=('gcc-libs')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/ocornut/imgui/tar.gz/v${pkgver}"
        "CMakeLists.txt.v${pkgver}-${pkgrel}::https://raw.githubusercontent.com/microsoft/vcpkg/master/ports/imgui/CMakeLists.txt"
        "imgui-config.cmake.in.v${pkgver}-${pkgrel}::https://raw.githubusercontent.com/microsoft/vcpkg/master/ports/imgui/imgui-config.cmake.in")
sha256sums=('eab371005c86dd029523a0c4ba757840787163740d45c1f4e5a110eb21820546'
            'babb55a73a4449c4cee837ae029a9cf346089324400922e2f59ba22b08b6ce73'
            '872817faad3a5c1f221a42309dc1b7c9c26434630df63d49a2b85a573c9598ed')

prepare () {
  cp CMakeLists.txt.v${pkgver}-${pkgrel}        ${pkgname}-${pkgver}/CMakeLists.txt
  cp imgui-config.cmake.in.v${pkgver}-${pkgrel} ${pkgname}-${pkgver}/imgui-config.cmake.in
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
