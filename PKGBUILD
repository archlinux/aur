# Maintainer: Solomon Choina <shlomochoina@gmail.com>
pkgname=libgnt3-hg
pkgver=r1339.0ed43e4e8a74
pkgrel=1
pkgdesc="The GLib Ncurses Toolkit"
arch=('x86_64')
url="https://bitbucket.org/pidgin/libgnt"
license=('GPL3')
depends=('glib2' 'ncurses' 'libxml2' 'python2')
makedepends=('mercurial' 'meson' 'libxml2' 'python' 'gobject-introspection' 'gtk-doc')
provides=("${pkgname%-VCS}")
conflicts=("${pkgname%-VCS}")
source=('hg+https://bitbucket.org/pidgin/libgnt')
sha256sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/${pkgname%3-hg}"

	printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

build() {
	arch-meson libgnt build
  ninja -C build
}

#check() {
#	make -k check
#}

package() {
	DESTDIR="$pkgdir/" ninja -C build install
}
