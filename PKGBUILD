# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=damask-wallpaper
pkgver=0.2.2
pkgrel=1
pkgdesc="Automatically set wallpaper images from Internet sources"
arch=('x86_64')
url="https://gitlab.gnome.org/subpop/damask"
license=('GPL-3.0-or-later')
depends=(
  'json-glib'
  'libadwaita'
  'libgee'
  'libportal-gtk4'
  'libsoup3'
)
makedepends=(
  'blueprint-compiler'
  'meson'
  'vala'
)
checkdepends=(
  'appstream-glib'
)
source=("$url/-/archive/v$pkgver/damask-v$pkgver.tar.gz")
sha256sums=('1e1939af48c89665a7d28f146e0105a4bc8262bc0a152c1f697d4c87609ea255')

build() {
  arch-meson "damask-v$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
