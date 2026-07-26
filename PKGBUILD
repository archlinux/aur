# Maintainer: aur.chaotic.cx
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: jose <jose1711 [at] gmail (dot) com>

_pkgname="diodon"
pkgname="$_pkgname"
pkgver=1.14.0
pkgrel=1
pkgdesc="GTK+ clipboard manager"
url="https://github.com/diodon-dev/diodon"
license=('GPL-2.0-or-later')
arch=('x86_64')

depends=(
  'gtk3'
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
sha256sums=('b4cae905261ac0cca099f04b0de8463f1d289c0295c9ea2df521eda03af1055e')

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
