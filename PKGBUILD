# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: danb (danb) <danb (at) hasi.it>

pkgname=avizo
pkgver=1.2.1
pkgrel=1
pkgdesc="A neat notification daemon"
arch=('x86_64')
url="https://github.com/misterdanb/avizo"
license=('GPL')
depends=(
  'alsa-utils'
  'dbus'
  'gobject-introspection'
  'gtk-layer-shell'
  'gtk3'
)
optdepends=(
  'brightnessctl: for helper script lightctl'
  'light: for helper script lightctl'
  'pamixer: for helper script volumectl'
)
makedepends=(
  'vala'
  'meson'
  'ninja'
)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('efd4763db7c802d22e8939dac909d4886f5967aefbfc3fd526735da2a814b91b')

build() {
  cd $pkgname-$pkgver

  arch-meson . build
  meson compile -C build
}

check() {
  cd $pkgname-$pkgver

  meson test -C build
}

package() {
  cd $pkgname-$pkgver

  meson install -C build --destdir "$pkgdir"
}
