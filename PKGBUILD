# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>
pkgname=hypatia
pkgver=0.1.4
pkgrel=2
pkgdesc="A research helper tool for Linux desktops"
arch=('x86_64')
url="https://codeberg.org/nathandyer/Hypatia"
license=('GPL-3.0-or-later')
depends=(
  'dconf'
  'gtk4'
  'json-glib'
  'libadwaita'
  'libgee'
  'libsoup'
)
makedepends=(
  'git'
  'meson'
  'vala'
)
checkdepends=('appstream-glib')
source=("git+https://codeberg.org/nathandyer/Hypatia.git#tag=$pkgver")
sha256sums=('08b67395a2a67461da09ed918999c7916ccf4f7a7889c4d49316e299daeabc8a')

build() {
  arch-meson Hypatia build
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs || :
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
