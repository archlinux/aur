# Maintainer: Taiki Sugawara <buzz.taiki@gmail.com>
pkgname=libskk-git
_pkgname=${pkgname%-git}
pkgver=r408.5f5e5c2
pkgrel=2
pkgdesc='GObject-based library to deal with Japanese kana-to-kanji conversion method (git)'
arch=('x86_64')
url='https://github.com/ueno/libskk'
license=('GPL3')
depends=('libgee' 'libxkbcommon' 'json-glib')
makedepends=('intltool' 'gnome-common' 'gobject-introspection' 'vala')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/ueno/$_pkgname.git")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  ./autogen.sh --prefix=/usr
  make
}

check() {
  cd "$srcdir/$_pkgname"
  make check
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
