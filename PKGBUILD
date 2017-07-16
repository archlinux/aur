# Maintainer: Daniel <nieltansah+aur [at] gmail [dot] com>

pkgname=jsonrpc-glib
pkgver=3.25.3
pkgrel=1
pkgdesc='JSON-RPC library for GLib'
url='https://github.com/GNOME/jsonrpc-glib'

arch=(i686 x86_64)
license=(GPL)

depends=(
	glib2
	json-glib
)
makedepends=(
	git	# gather source code
	meson	# build system
	gobject-introspection	# generate gir
	vala	# generate vapi
)

_commit=df1e5fb5a9aeaf4543871780836ea35b595e1e44
source=("git+https://git.gnome.org/browse/jsonrpc-glib#commit=$commit")
sha256sums=('SKIP')

prepare() {
	if ! test -d build; then
		mkdir build
		cd build
		meson --prefix=/usr --buildtype=release ../$pkgname --libexecdir=/usr/lib
	fi
}

build() {
	cd build
	ninja
}

check() {
	cd build
	ninja test
}

package() {
	cd build
	DESTDIR="$pkgdir" ninja install
}
