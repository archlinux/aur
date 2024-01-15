# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: danb (danb) <danb (at) hasi.it>

pkgname=avizo
pkgver=1.2.1
pkgrel=2
pkgdesc="A neat notification daemon"
url="https://github.com/misterdanb/avizo"
arch=(x86_64)
license=(GPL-3.0-only)
depends=(
  alsa-utils
  cairo
  dbus
  glib2
  glibc
  gobject-introspection
  gtk-layer-shell
  gtk3
)
makedepends=(
  meson
  ninja
  vala
)
optdepends=(
  'brightnessctl: for helper script lightctl'
  'light: for helper script lightctl'
  'pamixer: for helper script volumectl'
)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('efd4763db7c802d22e8939dac909d4886f5967aefbfc3fd526735da2a814b91b')

_archive="$pkgname-$pkgver"

build() {
  cd "$_archive"

  arch-meson . build
  meson compile -C build
}

# No tests available.

package() {
  cd "$_archive"

  meson install -C build --destdir "$pkgdir"
}
