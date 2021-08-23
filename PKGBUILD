pkgname=imgui
pkgver=1.84.2
pkgrel=1
pkgdesc="Bloat-free Graphical User interface for C++"
license=('MIT')
arch=('x86_64')
url="https://github.com/ocornut/imgui"
depends=('gcc-libs' 'wget')
makedepends=('cmake')
source=("https://codeload.github.com/ocornut/imgui/tar.gz/v${pkgver}")
sha256sums=('35cb5ca0fb42cb77604d4f908553f6ef3346ceec4fcd0189675bdfb764f62b9b')

prepare() {
  cd $pkgname-$pkgver
  wget https://raw.githubusercontent.com/microsoft/vcpkg/master/ports/imgui/CMakeLists.txt
  wget https://raw.githubusercontent.com/microsoft/vcpkg/master/ports/imgui/imgui-config.cmake.in  
}


build() {
  cd $pkgname-$pkgver
  mkdir -p build && cd build 
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_SHARED_LIBS=ON ..
  make
}

package() {
  cd $pkgname-$pkgver/build
  make DESTDIR="$pkgdir" install
}

