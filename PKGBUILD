# Maintainer: staalmannen <staal1978@gmail.com>
pkgname=gtk-made-qt-git
pkgver=r1
pkgrel=1
pkgdesc="The GTK 1.2/2/3/4 C API on Qt 6: build GTK programs that run without GTK"
arch=(x86_64 aarch64)
url="https://github.com/staalmannen/gtk-made-qt"
license=(LGPL-2.1-or-later)
depends=(qt6-base glib2 cairo pango)
makedepends=(cmake git)
provides=(gtk-made-qt)
conflicts=(gtk-made-qt)
options=(staticlibs !lto)
source=("git+https://github.com/staalmannen/gtk-made-qt.git")
sha256sums=(SKIP)

pkgver() {
  cd gtk-made-qt
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S gtk-made-qt -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release \
    -DGTKQT_BUILD_EXAMPLES=OFF -DGTKQT_BUILD_TESTS=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

