# Maintainer: Arthur Sonzogni <sonzogniarthur+ftxui at gmail dot com>
# Maintainer: Aditya Gupta <adityag.ug19.cs at  nitp.ac.in>
pkgname=ftxui-git
pkgver=r315.e87ff7e
pkgrel=1
pkgdesc="FTXUI is a C++ Functional Terminal User Interface library."
arch=("any")
url="https://github.com/ArthurSonzogni/FTXUI"
license=("MIT")
depends=()
makedepends=("git" "cmake")
provides=("ftxui")
conflicts=("ftxui")
install=".install"
source=("ftxui::git+https://github.com/ArthurSonzogni/FTXUI")
md5sums=("SKIP")

pkgver() {
  cd "$srcdir/ftxui"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/ftxui"
  mkdir -p build && cd build
  cmake \
    -DFTXUI_ENABLE_INSTALL=ON \
    -DFTXUI_BUILD_EXAMPLES=OFF \
    -DFTXUI_BUILD_TESTS=OFF \
    -DFTXUI_BUILD_DOCS=OFF \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    ..

  cmake --build .
}

package() {
  cd "$srcdir/ftxui"
  cd build
  DESTDIR="$pkgdir/" cmake --install .
}
