# Maintainer: Martin Schwan <mschwan@posteo.de>

pkgname=partup
pkgver=3.0.1
pkgrel=1
pkgdesc="System initialization program formatting and writing flash devices"
arch=(x86_64)
url="https://github.com/phytec/partup"
license=(GPL3)
depends=(
  dosfstools
  e2fsprogs
  glib2
  libyaml
  mtd-utils
  parted
  squashfs-tools
  tar
  util-linux
)
makedepends=(
  meson
  pkgconf
)
source=("https://github.com/phytec/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=("ce24e51d98ae46681e5293cee2617058ad2ae8bfb7d65fb0bbbc1d1499e60ffe")

prepare() {
  cd $pkgname-$pkgver
}

build() {
  arch-meson $pkgname-$pkgver build
  meson compile -C build
}

check() {
  meson test --suite user -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
