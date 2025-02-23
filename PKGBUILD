# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=obs-transition-table
pkgver=0.2.7
pkgrel=2
pkgdesc="Plugin for OBS Studio to add a Transition Table to the tools menu"
arch=("x86_64" "aarch64")
url="https://obsproject.com/forum/resources/transition-table.1174/"
license=("GPL-2.0-or-later")
depends=("obs-studio>=28" "glibc" "gcc-libs" "qt6-base")
makedepends=("cmake" "git")
source=("$pkgname::git+https://github.com/exeldro/$pkgname#commit=1a85ab9de529ff521b7acad206ab55f4da72ac73")
sha256sums=("SKIP")

build() {
  cmake -B build -S "$pkgname"\
  -DCMAKE_BUILD_TYPE=None \
  -DCMAKE_INSTALL_PREFIX='/usr' \
  -DCMAKE_INSTALL_LIBDIR=lib \
  -DLINUX_PORTABLE=OFF \
  -DQT_VERSION=6 \
  -DCMAKE_CXX_FLAGS="-Wno-error=deprecated-declarations" \
  -Wno-dev

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
