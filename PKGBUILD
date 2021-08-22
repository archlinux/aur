# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

_pkgname=libadwaita
pkgname="$_pkgname-health"
pkgver=r1547.660d529
_commit=660d529a6abb571fb592353f67d56915cb5abe54
pkgrel=1
pkgdesc='Building blocks for modern GNOME applications (version required by health)'
arch=(x86_64)
url=https://gitlab.gnome.org/exalm/libadwaita
license=(LGPL)
depends=(gtk4)
makedepends=(git meson gobject-introspection vala)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git#commit=$_commit")
md5sums=(SKIP)

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	arch-meson "$_pkgname" build -Dgtk_doc=false
	meson compile -C build
}

package() {
	DESTDIR="$pkgdir" ninja -C build install
}
