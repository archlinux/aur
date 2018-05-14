# Maintainer: Solomon Choina <shlomochoina@gmail.com>
pkgname=gxine-hg
pkgver=r2489.d96baecd1c34
pkgrel=2
pkgdesc="GTK-based front end for xine"
arch=('x86_64')
url="https://www.xine-project.org"
license=('GPL')
depends=('xine-lib' 'gtk3')
makedepends=('mercurial')
options=()
source=('hg+http://hg.code.sf.net/p/xine/gxine')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/gxine"

	printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"

}

build() {
	cd "$srcdir/gxine"
	./autogen.sh
	./configure --prefix=/usr --sysconfdir=/etc --with-xcb --with-x --with-gtk3 --with-gudev
	make
}

check() {
	cd "$srcdir/gxine"
	make -k check
}

package() {
	cd "$srcdir/gxine"
	make DESTDIR="$pkgdir/" install
}
