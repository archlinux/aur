# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=obs-loudness-dock
pkgver=0.2.2
pkgrel=1
pkgdesc="This is a plugin to provide a dock window displaying EBU R 128 loudness meter"
arch=("x86_64" "aarch64")
url="https://obsproject.com/forum/resources/loudness-dock.1751/"
license=(GPL-2.0-or-later)
depends=("obs-studio>=28" "glibc" "gcc-libs" "libebur128" "qt6-base")
makedepends=("cmake")
options=('debug')
source=("$pkgname-$pkgver.tar.gz::https://github.com/norihiro/$pkgname/archive/$pkgver.tar.gz")
sha256sums=("7e8d94c520d1db3fa5e06d3591a9128baba7c1d6e5a2c11dcd48f08b55615ff1")

build() {
  cmake -B build -S "$pkgname-$pkgver" \
  -DCMAKE_BUILD_TYPE=None \
  -DCMAKE_INSTALL_PREFIX='/usr' \
  -DCMAKE_INSTALL_LIBDIR=lib \
  -DLINUX_PORTABLE=OFF \
  -DQT_VERSION=6 \
  -Wno-dev

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
