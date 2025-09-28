# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=damask-wallpaper
pkgver=0.3.1
pkgrel=1
pkgdesc="Automatically set wallpaper images from Internet sources"
arch=('x86_64')
url="https://gitlab.gnome.org/subpop/damask"
license=('GPL-3.0-or-later')
depends=(
  'gtk4'
  'json-glib'
  'libadwaita'
  'libgee'
  'libportal'
  'libportal-gtk4'
  'libsoup3'
)
makedepends=(
  'blueprint-compiler'
  'meson'
  'vala'
)
checkdepends=('appstream-glib')
source=("$url/-/archive/v$pkgver/damask-v$pkgver.tar.gz")
sha256sums=('9c6ddd907335703f72ee1ff38ef1bfdece7a56eb28038bf0446b347a063a6512')

build() {
  arch-meson "damask-v$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
