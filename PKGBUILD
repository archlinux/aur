# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=obs-loudness-dock
pkgver=0.2.1
pkgrel=1
pkgdesc="This is a plugin to provide a dock window displaying EBU R 128 loudness meter"
arch=("x86_64" "aarch64")
url="https://obsproject.com/forum/resources/loudness-dock.1751/"
license=(GPL-2.0-or-later)
depends=("obs-studio>=28" "glibc" "gcc-libs" "libebur128" "qt6-base")
makedepends=("cmake")
options=('debug')
source=("$pkgname-$pkgver.tar.gz::https://github.com/norihiro/$pkgname/archive/$pkgver.tar.gz")
sha256sums=("68e5255210a7370a8b10cfa188cebcea8b0f9d37e430c2f8a49974696cb486cd")

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
