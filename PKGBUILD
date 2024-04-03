# Maintainer: fossdd <fossdd@pwned.life>
pkgname=gmobile-git
_pkgname=gmobile
pkgver=0.1.0.r5.7d55bed
pkgrel=1
pkgdesc="Functions useful in mobile related, glib based projects"
arch=('x86_64')
url="https://gitlab.gnome.org/World/Phosh/gmobile"
license=('GPL-3.0')
depends=('glib2' 'json-glib')
makedepends=('git' 'meson')
provides=($_pkgname)
conflicts=($_pkgname)
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
