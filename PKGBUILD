pkgname=gforth-git
pkgver=20231204
pkgrel=1
pkgdesc="Gforth is the Forth implementation of the GNU project."
arch=(i686 x86_64)
url="https://www.gnu.org/software/gforth"
license=('GPLv3')
depends=()
makedepends=("make" "git" "gforth" "texinfo" "automake" "autoconf")
provides=("gforth")
conflicts=("gforth")
source=('git+https://git.savannah.gnu.org/git/gforth.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/gforth"
        git show -s --format="%ci" HEAD | sed -e 's/-//g' -e 's/ .*//'
}

build() {
	cd "$srcdir/gforth"
	./autogen.sh
	./configure --prefix=/usr
	make -j $(nproc)
	make -j $(nproc) doc
	make -j $(nproc) more
}

check() {
	cd "$srcdir/gforth"
	make -k check
}

package() {
	cd "$srcdir/gforth"
	make DESTDIR="$pkgdir/" install
}
