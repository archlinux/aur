# Maintainer:
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: jose <jose1711 [at] gmail (dot) com>

_pkgname="diodon"
pkgname="$_pkgname"
pkgver=1.13.0
pkgrel=3
pkgdesc="GTK+ clipboard manager"
url="https://launchpad.net/diodon"
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
_pkgext="tar.xz"
source=("$_pkgsrc.$_pkgext"::"$url/trunk/$pkgver/+download/$_pkgsrc.$_pkgext")
sha256sums=('5f25ce431ef083afdefa50103f22d3e16d47ec753ed2b29867a04e25146e17a1')

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
