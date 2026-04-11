# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cine
pkgver=1.2.3
pkgrel=1
pkgdesc="Video Player for Linux"
arch=('any')
url="https://github.com/diegopvlk/Cine"
license=('GPL-3.0-or-later')
depends=(
  'gtk4'
  'libadwaita'
  'mpv'
  'python-gobject'
  'python-mpv'
)
makedepends=(
  'blueprint-compiler'
  'meson'
)
source=("Cine-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('68e5b2bbd5dc4959f400f98f7e7c227c33eba8eef7ed1a0e3a71da25a1461135')

build() {
  arch-meson "Cine-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs || :
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
