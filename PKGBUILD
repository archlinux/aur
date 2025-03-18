pkgname=darkmark-git
pkgver=1.10.18
pkgrel=1
pkgdesc="DarkMark: GUI for Darknet and DarkHelp"
arch=('x86_64' 'aarch64' 'i686')
url="https://github.com/stephanecharette/DarkMark"
license=('GPL3')
depends=('darkhelp-git' 'darknet-hankai-git' 'opencv' 'libx11' 'freetype2' 'libxrandr' 'libxinerama' 'libxcursor' 'file' 'poppler' 'ttf-liberation')
makedepends=('cmake' 'git')
source=("git+https://github.com/stephanecharette/DarkMark.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/DarkMark"
  cat version.txt | cut -d '-' -f 1
}

build() {
  cd "$srcdir/DarkMark"
  mkdir -p build && cd build
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr ..
  make -j"$(nproc)"
}

package() {
  cd "$srcdir/DarkMark/build"
  make install DESTDIR="$pkgdir"
}
