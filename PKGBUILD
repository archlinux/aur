# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=obs-source-dock
pkgver=0.4.1
pkgrel=1
pkgdesc="Plugin for OBS Studio allowing you to create a Dock for a source, which lets you interact, see audio levels, change volume and control media"
arch=("x86_64" "aarch64")
url="https://obsproject.com/forum/resources/source-dock.1317/"
license=(GPL-2.0-or-later)
depends=("obs-studio>=30" "glibc" "gcc-libs" "qt6-base")
makedepends=("cmake" "git")
options=("debug")
source=("$pkgname::git+https://github.com/exeldro/$pkgname#tag=$pkgver")
sha256sums=("SKIP")

build() {
  cmake -B build -S "$pkgname" \
  -DCMAKE_BUILD_TYPE=None \
  -DCMAKE_INSTALL_PREFIX='/usr' \
  -DCMAKE_INSTALL_LIBDIR=lib \
  -DLINUX_PORTABLE=OFF \
  -DQT_VERSION=6 \
  -DCMAKE_CXX_FLAGS="-Wno-error=deprecated-declarations -Wno-error=switch" \
  -Wno-dev

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
