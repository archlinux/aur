# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: danb (danb) <danb (at) hasi.it>

pkgname=avizo
pkgver=1.2
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
sha256sums=('af44eda6d5247817396dc675b6823905f2c060f5bcefaa64f2c19ff61a7a7e36')

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
