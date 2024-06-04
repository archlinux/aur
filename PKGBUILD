# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=obs-source-clone
pkgver=0.1.5
pkgrel=1
pkgdesc="Plugin for OBS Studio to clone sources"
arch=("x86_64" "aarch64")
url="https://obsproject.com/forum/resources/source-clone.1632/"
license=(GPL-2.0-or-later)
depends=("obs-studio>=28" "glibc")
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
  -DCMAKE_C_FLAGS="-Wno-error=deprecated-declarations" \
  -Wno-dev

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
