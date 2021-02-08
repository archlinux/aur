# Maintainer Cédric Bellegarde

pkgname=passbook-stable-git
pkgver=0.8.r34.g52aa824
pkgrel=1
pkgdesc='Password manager for GNOME (stable branch: last release + fixes)'
arch=(any)
url=https://gitlab.gnome.org/gnumdk/passbook
license=(GPL)
depends=(
	appstream-glib
	gtk3
	python-cairo
	python-gobject
	
)
makedepends=(
	git
	gobject-introspection
	intltool
	itstool
	meson
)
optdepends=(
	'python-pykeepass: Support for keepass files'
)

conflicts=("passbook" "passbook-git" "passbook-next-git")
provides=("passbook")
source=("git+https://gitlab.gnome.org/gnumdk/passbook")

pkgver() {
	cd "$srcdir/passbook"

	git describe --tags \
		| sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	arch-meson passbook build \
		--libexecdir='lib/passbook'
	ninja -C build
}

package() {
	DESTDIR="${pkgdir}" ninja -C build install
}

md5sums=('SKIP')
