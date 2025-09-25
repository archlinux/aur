# Maintainer: Martin Schwan <mschwan@posteo.de>

pkgname=partup
pkgver=3.0.0
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
sha256sums=("88d58599d2d78639579599a34810f5347c4363e42b24a86e9250fdeb882afb36")

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
