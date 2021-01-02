# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=at-spi2-atk-git
pkgver=2.38.0
pkgrel=1
pkgdesc="A GTK+ module that bridges ATK to D-Bus at-spi"
url="https://wiki.gnome.org/Accessibility"
arch=(x86_64)
license=(LGPL)
depends=(at-spi2-core libx11 libxml2 atk)
makedepends=(git meson)
provides=(at-spi2-atk)
conflicts=(at-spi2-atk)
source=("git+https://gitlab.gnome.org/GNOME/at-spi2-atk.git")
sha256sums=('SKIP')

pkgver() {
  cd at-spi2-atk
  git describe --tags | sed 's/^AT_SPI2_ATK_//;s/_/./g;s/-/+/g'
}

prepare() {
  cd at-spi2-atk
}

build() {
  arch-meson at-spi2-atk build
  meson compile -C build
}

#check() {
#  dbus-run-session meson test -C build --print-errorlogs
#}

package() {
  DESTDIR="$pkgdir" meson install -C build
}

# vim:set ts=2 sw=2 et:
