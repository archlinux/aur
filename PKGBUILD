# Maintainer: staalmannen <staal1978@gmail.com>
pkgname=motif-on-qt-git
pkgver=r1
pkgrel=1
pkgdesc="The Motif, Athena, Xt and Xlib APIs on Qt 6: build Motif and Xaw programs without X11"
arch=(x86_64 aarch64)
url="https://github.com/staalmannen/motif-on-qt"
license=(LGPL-2.1-or-later MIT)
depends=(qt6-base)
makedepends=(cmake git)
provides=(motif-on-qt)
conflicts=(motif-on-qt)
options=(staticlibs !lto)
source=("git+https://github.com/staalmannen/motif-on-qt.git")
sha256sums=(SKIP)

pkgver() {
  cd motif-on-qt
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S motif-on-qt -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release \
    -DMQ_BUILD_EXAMPLES=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

