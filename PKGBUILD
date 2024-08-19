# Maintainer:
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: jose <jose1711 [at] gmail (dot) com>

_pkgname="diodon"
pkgname="$_pkgname"
pkgver=1.13.0
pkgrel=4
pkgdesc="GTK+ clipboard manager"
url="https://github.com/diodon-dev/diodon"
license=('GPL-2.0-or-later')
arch=('x86_64')

depends=(
  'libayatana-appindicator'
  'libpeas'
  'zeitgeist'
)
makedepends=(
  'gobject-introspection'
  'meson'
  'vala'
  'xorg-server-xvfb'
)

_pkgsrc="$pkgname-$pkgver"
_pkgext="tar.gz"
source=("$_pkgsrc.$_pkgext"::"$url/archive/refs/tags/$pkgver.$_pkgext")
sha256sums=('387e78e24dfcac5a73c65ff758c66894a712f7d10754b4ffcfdc11590a9e0a10')

build() {
  arch-meson "$_pkgsrc" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
