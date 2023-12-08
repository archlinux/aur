# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=obs-scene-notes-dock
pkgver=0.2.0
pkgrel=2
pkgdesc="Plugin for OBS Studio allowing you to create a Dock for showing and editing notes for the current active scene"
arch=("x86_64" "aarch64")
url="https://obsproject.com/forum/resources/scene-notes-dock.1398/"
license=("GPL2")
depends=("obs-studio>=28" "gcc-libs" "glibc" "qt6-base")
makedepends=("cmake" "git")
options=('debug')
source=("$pkgname::git+https://github.com/exeldro/$pkgname#tag=$pkgver")
sha256sums=("SKIP")

build() {
  # TODO: Next version will support 30 new API, update depends to require 30
  export CXXFLAGS+=" -Wno-error=deprecated-declarations"

  cmake -B build -S $pkgname \
  -DCMAKE_BUILD_TYPE=None \
  -DCMAKE_INSTALL_PREFIX='/usr' \
  -DCMAKE_INSTALL_LIBDIR=lib \
  -DLINUX_PORTABLE=OFF \
  -DQT_VERSION=6

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
