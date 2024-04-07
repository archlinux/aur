# shellcheck shell=bash disable=SC2034,SC2154
pkgname=boson
pkgver=0.1
pkgrel=1
pkgdesc="boson is an implementation of the meson language written in C11 focusing on portability and simplicity"
arch=(i686 x86_64 arm aarch64)
url=https://git.sr.ht/~bl4ckb0ne/boson
license=(GPL3)
makedepends=(meson)
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('7a8025a0a4d2760885f92af3d304807c435819fbcaf3f67bad083dac342ab8d3')

prepare() {
  cd $pkgname-$pkgver || exit 1
  sed -i /werror=true/d meson.build
}

build() {
  arch-meson $pkgname-$pkgver build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -D build/boson -t "$pkgdir/usr/bin"
}
