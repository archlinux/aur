# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=obs-dynamic-delay
pkgver=0.1.4
pkgrel=2
pkgdesc="Filter for dynamic delaying a video source"
arch=("x86_64" "aarch64")
url="https://obsproject.com/forum/resources/dynamic-delay.1035/"
license=("GPL-2.0-or-later")
depends=("obs-studio>=28" "glibc")
makedepends=("cmake" "git")
source=("$pkgname::git+https://github.com/exeldro/$pkgname#commit=c6d4fbb7b7f30fb37c1e19738b37d4615df3f77a")
sha256sums=("SKIP")

build() {
  cmake -B build -S $pkgname \
  -DCMAKE_BUILD_TYPE=None \
  -DCMAKE_INSTALL_PREFIX='/usr' \
  -DCMAKE_INSTALL_LIBDIR=lib \
  -DLINUX_PORTABLE=OFF \
  -DQT_VERSION=6 \
  -DCMAKE_C_FLAGS="-Wno-error=deprecated-declarations" \
  -Wno-dev

  cmake --build build
}

package() {
 DESTDIR="$pkgdir" cmake --install build
}
