# Maintainer: weqeqq <ggmodwear@gmail.com> 

pkgname=file-cpp-git 
pkgver=r12.fcb5eca
pkgrel=4
pkgdesc="C++ wrapper library around std::fstream"
arch=(any)
url="https://github.com/weqeqq/file-cpp"
license=('MIT')
makedepends=('git' 'cmake' 'make' 'gcc')
provides=('file-cpp')
conflicts=('file-cpp')
source=("git+https://github.com/weqeqq/file-cpp.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/file-cpp"

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/file-cpp"

  cmake -S . -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DFILE_CPP_BUILD_TESTS=OFF -DFILE_CPP_BUILD_DOCS=OFF
  cmake --build build 
}

package() {
  cd "$srcdir/file-cpp"

  DESTDIR="$pkgdir" cmake --install build
}
