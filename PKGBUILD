# Maintainer: Martin Schwan <mschwan@posteo.de>

pkgname=partup
pkgver=0.4.0
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
sha256sums=("1777ab51ddaa0b030069e0499eb9bb6181f272764f2a2069105cea2d575ed7ad")

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
