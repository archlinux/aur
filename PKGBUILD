# Maintainer: fossdd <fossdd@pwned.life>
pkgname=libgmobile-git
_pkgname=gmobile
pkgver=0.2.1.r0.ca8db41
pkgrel=3
pkgdesc="Functions useful in mobile related, glib based projects"
arch=('x86_64')
url="https://gitlab.gnome.org/World/Phosh/gmobile"
license=('GPL-3.0')
depends=('glib2' 'json-glib' 'gobject-introspection')
makedepends=('git' 'meson')
provides=(lib$_pkgname)
conflicts=(lib$_pkgname)
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g' | sed 's/^v//')"
}

build() {
	arch-meson $_pkgname _build
	meson compile -C _build
}

check() {
	meson test -C _build
}

package() {
	meson install -C _build --destdir "$pkgdir"
}
