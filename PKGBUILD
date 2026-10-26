# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cine
pkgver=1.8.8
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
checkdepends=(
  'appstream'
  'desktop-file-utils'
)
source=("Cine-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('49ffde93a9c5f596f07611c3e1cfe7458dd8017eff9a61fb22b367e7ad5ab82a')

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
