# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cine
pkgver=1.0.0
pkgrel=1
pkgdesc="Video Player for Linux"
arch=('any')
url="https://github.com/diegopvlk/Cine"
license=('GPL-3.0-or-later')
depends=(
  'gtk4'
  'libadwaita'
  'libass'
  'libplacebo'
  'mpv'
  'python-gobject'
  'python-mpv'
  'uchardet'
)
makedepends=(
  'blueprint-compiler'
  'meson'
)
source=("Cine-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ec69c79a608cf0b7de331bcd1f8ef91f31bdfe4e8fb83be070487034d9c7624a')

build() {
  arch-meson "Cine-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
