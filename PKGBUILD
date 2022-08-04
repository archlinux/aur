# Maintainer: Malte Jürgens <maltejur@dismail.de>

pkgname=discord-screenaudio
pkgver=1.3.0
pkgrel=1
pkgdesc="Custom discord client with the ability to stream desktop audio"
arch=("x86_64")
url="https://github.com/maltejur/discord-screenaudio"
license=("GPL-3.0")
depends=(qt5-base qt5-webengine knotifications pipewire xdg-desktop-portal-impl)
makedepends=(qt5-base qt5-webengine knotifications pipewire cmake)
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/maltejur/$pkgname/archive/refs/tags/v$pkgver.tar.gz"
  "rohrkabel-1.2.tar.gz::https://github.com/Soundux/rohrkabel/archive/refs/tags/v1.2.tar.gz"
)
sha256sums=(
  "b28f7125865c648e69feb5e08681a6749b66746710ce8553b76ccc96c0416380"
  "e167e50d4c633a2b96dde5faa28cd83dd56828868c669fcf86c7e0ade7db1dcd"
)

prepare() {
  rm -rf $pkgname-$pkgver/submodules/rohrkabel
  mv -v rohrkabel-1.2 $pkgname-$pkgver/submodules/rohrkabel
  echo "$pkgver" >$pkgname-$pkgver/version.txt
}

build() {
  cmake -B build -S $pkgname-$pkgver -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build --config Release
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
