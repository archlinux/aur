# Maintainer: Martin Schwan <mschwan@posteo.de>

pkgname=partup
pkgver=2.0.0
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
sha256sums=("f79a0d5330677e848e85fa4c937951ab6cec76634acb1cd2e3bd1db0bc429fdb")

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
