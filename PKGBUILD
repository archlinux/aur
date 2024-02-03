# Maintainer: Solomon Choina <shlomochoina@gmail.com>
pkgname=libgnt3-hg
pkgver=2.14.5r1467.e9f4e4f0cf13
epoch=1
pkgrel=1
pkgdesc="The GLib Ncurses Toolkit"
arch=('x86_64')
url="https://keep.imfreedom.org/libgnt/libgnt"
license=('GPL-2.0-or-later')
depends=('glib2' 'ncurses' 'libxml2' 'python')
makedepends=('mercurial' 'meson' 'gobject-introspection')
provides=("${pkgname%-hg}" "libgnt")
conflicts=("${pkgname%-hg}" "libgnt")
source=('hg+https://keep.imfreedom.org/libgnt/libgnt#branch=default')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%3-hg}"

	printf "2.14.5r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

build() {
  arch-meson libgnt build -Ddoc=false
  ninja -C build
}

#check() {
#	make -k check
#}

package() {
  DESTDIR="$pkgdir/" ninja -C build install
}
