# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=obs-loudness-dock
pkgver=0.2.0
pkgrel=2
pkgdesc="This is a plugin to provide a dock window displaying EBU R 128 loudness meter"
arch=("x86_64" "aarch64")
url="https://obsproject.com/forum/resources/loudness-dock.1751/"
license=("GPL2")
depends=("obs-studio>=28" "glibc" "gcc-libs" "libebur128" "qt6-base")
makedepends=("cmake")
options=('debug')
source=("$pkgname-$pkgver.tar.gz::https://github.com/norihiro/$pkgname/archive/$pkgver.tar.gz")
sha256sums=("f0dbf84b11cae9f28e1e62b21f9e81ff2d361dbbdcdb66cd5317dd9b45748720")

prepare()
{
  sed -i 's/LIBOBS_API_VER </LIBOBS_API_VER <=/g' "$pkgname-$pkgver/src/plugin-main.c"
  sed -i 's/LIBOBS_API_VER </LIBOBS_API_VER <=/g' "$pkgname-$pkgver/src/dock-compat.cpp"
}

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
