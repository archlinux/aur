# Maintainer: ForumPlayer <fp@forumplayer.dev>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=gnome-calculator-41
pkgver=41.1
pkgrel=1
pkgdesc="GNOME Scientific calculator"
url="https://wiki.gnome.org/Apps/Calculator"
arch=(x86_64)
license=(GPL)
depends=(libadwaita dconf gtksourceview5 mpfr libsoup libmpc libgee libhandy) 
makedepends=(yelp-tools vala git meson gobject-introspection)
conflicts=("${pkgname%-41}" "${pkgname%-41}-git")
provides=("${pkgname%-41}")
#groups=(gnome)
options=(debug)

_commit=1e576c9b024439c3d6fe814b40c22edfa94618e6  # tags/41.1^0
source=("git+https://github.com/ForumPlayer/gnome-calculator-41.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

build() {
  arch-meson $pkgname build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
