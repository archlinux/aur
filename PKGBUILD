
pkgname=fplll-git
pkgver=4.0.5
pkgrel=1

pkgdesc="Implementations of the floating-point LLL reduction algorithm for euclidean lattices"
arch=('any')
url="http://perso.ens-lyon.fr/damien.stehle/fplll/"
license=('LGPL')

depends=('gmp>=4.2.0' 'mpfr>=2.3.0')
provides=("fplll libfplll")
conflicts=('fplll libfplll')

source=('git+https://github.com/dstehle/fplll.git')
md5sums=('SKIP')

_gitname='fplll'

pkgver() {
	cd "$srcdir/$_gitname"
	# Get the version from configure.ac
	sed -n -e 's/AC_INIT(libfplll,\s*\(4.0.5\s*\))/\1/p' configure.ac
}

build() {
	cd "$srcdir/$_gitname"
	autoreconf -vi
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$_gitname"
	make DESTDIR="$pkgdir" install
}

