# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=obs-media-controls
pkgver=0.4.0
pkgrel=1
pkgdesc="Add Media Controls Dock to OBS"
arch=("x86_64" "aarch64")
url="https://obsproject.com/forum/resources/media-controls.1032/"
license=("GPL2")
depends=("obs-studio>=28" "gcc-libs" "glibc")
makedepends=("cmake" "git")
options=('debug')
source=("$pkgname::git+https://github.com/exeldro/$pkgname#commit=a88a40759cfba680915ee3a626366c7bb3b849d4")
sha256sums=("SKIP")

build() {
  # TODO: Check if next version use 30 new API, then update depends to require 30
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
