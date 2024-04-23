# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=obs-downstream-keyer
pkgver=0.3.2
pkgrel=1
pkgdesc="Add a Downstream Keyer dock to OBS studio"
arch=("x86_64" "aarch64")
url="https://obsproject.com/forum/resources/downstream-keyer.1254/"
license=("GPL-2.0-or-later")
depends=("obs-studio>=30" "gcc-libs" "glibc" "qt6-base")
makedepends=("cmake" "git")
source=("$pkgname::git+https://github.com/exeldro/$pkgname#commit=2c6fd3805eff1b9f745f2ca5d2fe5e653c7ece45")
sha256sums=("SKIP")

build() {
  cmake -B build -S $pkgname \
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
