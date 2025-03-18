pkgname=darkhelp-git
pkgver=1.9.6
pkgrel=1
pkgdesc="DarkHelp: C++ helper class for Darknet's C API"
arch=('x86_64' 'aarch64' 'i686')
url="https://github.com/stephanecharette/DarkHelp"
license=('MIT')
depends=('darknet-hankai-git' 'tclap' 'file' 'opencv')
makedepends=('cmake' 'git')
source=("git+https://github.com/stephanecharette/DarkHelp.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/DarkHelp"
  cat version.txt | cut -d '-' -f 1
}

build() {
  cd "$srcdir/DarkHelp"
  mkdir -p build && cd build
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr ..
  make -j"$(nproc)"
}

package() {
  cd "$srcdir/DarkHelp/build"
  make install DESTDIR="$pkgdir"
}
