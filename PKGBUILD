# Maintainer: Solomon Choina <shlomochoina@gmail.com>
pkgname=libgnt3-hg
pkgver=r1371+.88c07b4791fa+
epoch=1
pkgrel=1
pkgdesc="The GLib Ncurses Toolkit"
arch=('x86_64')
url="https://bitbucket.org/pidgin/libgnt"
license=('GPL3')
depends=('glib2' 'ncurses' 'libxml2' 'python')
makedepends=('mercurial' 'meson' 'libxml2' 'python' 'gobject-introspection' 'gtk-doc')
provides=("${pkgname%-VCS}")
conflicts=("${pkgname%-VCS}")
source=('hg+https://bitbucket.org/pidgin/libgnt#branch=default'
        'libgnt3-python.patch')
sha256sums=('SKIP'
            'de8cf41d2aaa10afd630a55153f61e87b78d52ced02f4895de2362e9c794a85b')

pkgver() {
	cd "$srcdir/${pkgname%3-hg}"

	printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

prepare() {
  cd "$srcdir/${pkgname%3-hg}"
  patch -Np1 -i ../libgnt3-python.patch
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
