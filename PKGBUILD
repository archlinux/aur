# Maintainer: Malte Jürgens <maltejur@dismail.de>

pkgname=discord-screenaudio
_pkgver=1.0.0-rc.6
pkgver=$(echo "$_pkgver" | sed 's/-/./')
pkgrel=1
pkgdesc="Custom discord client with the ability to stream desktop audio"
arch=("x86_64")
url="https://github.com/maltejur/discord-screenaudio"
license=("GPL-3.0")
depends=(pipewire qt5-base qt5-webengine)
makedepends=(cmake qt5-base qt5-webengine pipewire)
source=(
  "$pkgname-$_pkgver.tar.gz::https://github.com/maltejur/$pkgname/archive/refs/tags/v$_pkgver.tar.gz"
  "rohrkabel-1.2.tar.gz::https://github.com/Soundux/rohrkabel/archive/refs/tags/v1.2.tar.gz"
)
sha256sums=(
  "4f755259cea1d8a426dc3d50c8b5fda001808a21b400a6975376fa9ccf3d3db8"
  "e167e50d4c633a2b96dde5faa28cd83dd56828868c669fcf86c7e0ade7db1dcd"
)

prepare() {
  rm -rf $pkgname-$_pkgver/submodules/rohrkabel
  mv -v rohrkabel-1.2 $pkgname-$_pkgver/submodules/rohrkabel
}

build() {
  cmake -B build -S $pkgname-$_pkgver -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build --config Release
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
