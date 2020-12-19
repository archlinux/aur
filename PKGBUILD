_name=sollya
pkgname=$_name-git
pkgver=v1208.gad49ac94
pkgrel=1

pkgdesc="A tool environment and a library for safe floating-point code development"
arch=('any')
url="https://gitlab.inria.fr/sollya/sollya.git"
license=('CeCILL-C')

depends=('gmp' 'mpfr' 'mpfi' 'libxml2' 'fplll')
optdepends=(
  'gnuplot: for using the plot and externalplot commands'
 )
conflicts=('sollya')
provides=('sollya')
source=(git+https://gitlab.inria.fr/sollya/sollya.git)
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_name"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/svn_legacy_branch_optimLists\.r/v/'
}

build() {
	cd "$srcdir/$_name"
	./autogen.sh
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$_name"
	make DESTDIR="$pkgdir" install
}

