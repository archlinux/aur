# Maintainer Cédric Bellegarde

pkgname=passbook-next-git
pkgver=0.8.r30.gb18f820
pkgrel=1
pkgdesc='Password manager for GNOME (dev branch)'
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

conflicts=("passbook" "passbook-git" "passbook-stable-git")
provides=("passbook")
source=("git+https://gitlab.gnome.org/gnumdk/passbook#branch=next")

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
