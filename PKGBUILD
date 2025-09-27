# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=obs-audio-monitor
pkgver=0.10.0
pkgrel=1
pkgdesc="Plugin for OBS Studio to add Audio Monitor dock and filter"
arch=("x86_64" "aarch64")
url="https://obsproject.com/forum/resources/audio-monitor.1186/"
license=(GPL-2.0-or-later)
depends=("obs-studio>=31" "glibc" "gcc-libs" "libpulse" "qt6-base")
makedepends=("cmake" "git")
options=("debug")
source=("$pkgname::git+https://github.com/exeldro/obs-audio-monitor#commit=245b0c258b369d6a21986c6037f59bb4a6b0cf62")
sha256sums=("SKIP")

build() {
  cmake -B build -S "$pkgname" \
  -DCMAKE_BUILD_TYPE=None \
  -DCMAKE_INSTALL_PREFIX='/usr' \
  -DCMAKE_INSTALL_LIBDIR=lib \
  -DLINUX_PORTABLE=OFF \
  -DQT_VERSION=6 \
  -DCMAKE_C_FLAGS="-Wno-error=deprecated-declarations" \
  -DCMAKE_CXX_FLAGS="-Wno-error=deprecated-declarations" \
  -Wno-dev

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}