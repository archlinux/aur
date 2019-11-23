# Maintainer: Solomon Choina <shlomochoina@gmail.com>
pkgname=libgnt3-hg
pkgver=r1371.88c07b4791fa
epoch=1
pkgrel=2
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
            'dba3a7df0b89b526c3b22df0b483121a6c3f90f396a435b6f6681113d3daf3c3')

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
