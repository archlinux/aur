# Maintainer:
# Contributor: Dustin Falgout <dustin@antergos.com>

_pkgname="brisk-menu"
pkgname="$_pkgname"
pkgver=0.6.2
pkgrel=1
pkgdesc="Modern, efficient menu for the MATE Desktop Environment"
url="https://github.com/getsolus/brisk-menu"
license=('GPL-2.0-or-later')
arch=('i686' 'x86_64')

depends=(
  'libnotify'
  'mate-panel'
)
makedepends=(
  'glib2-devel'
  'meson'
  'ninja'
)

_pkgsrc="$_pkgname-$pkgver"
_pkgext="tar.xz"
source=("$_pkgsrc.$_pkgext"::"https://github.com/getsolus/brisk-menu/releases/download/v$pkgver/$_pkgname-v$pkgver.$_pkgext")
sha256sums=('5a87f4dcf7365e81a571128bf0b8199eb06a6fcd7e15ec7739be0ccff1326488')

build() {
  CFLAGS="${CFLAGS/_FORTIFY_SOURCE=?/_FORTIFY_SOURCE=2}"

  arch-meson "$_pkgsrc" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
