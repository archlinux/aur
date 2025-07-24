# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=obs-freeze-filter
pkgver=0.3.5
pkgrel=1
pkgdesc="Filter to freeze a frame of a source"
arch=("x86_64" "aarch64")
url="https://obsproject.com/forum/resources/freeze-filter.950/"
license=("GPL-2.0-or-later")
depends=("glibc" "obs-studio>=28")
makedepends=("cmake" "git")
source=("$pkgname::git+https://github.com/exeldro/$pkgname#tag=$pkgver")
sha256sums=("SKIP")

build() {
  cmake -B build -S $pkgname \
  -DCMAKE_BUILD_TYPE=None \
  -DCMAKE_INSTALL_PREFIX='/usr' \
  -DCMAKE_INSTALL_LIBDIR=lib \
  -DLINUX_PORTABLE=OFF \
  -DCMAKE_C_FLAGS="-Wno-error=deprecated-declarations" \
  -Wno-dev

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
