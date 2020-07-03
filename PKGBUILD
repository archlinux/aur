_name=sollya
pkgname=$_name-git
pkgver=svn_legacy_branch_optimLists.r1206.g23d6eedf
pkgrel=1

pkgdesc="A tool environment and a library for safe floating-point code development"
arch=('any')
url="http://sollya.gforge.inria.fr/"
license=('CeCILL-C')

depends=('gmp' 'mpfr' 'mpfi' 'libxml2' 'fplll')
optdepends=(
  'gnuplot: for using the plot and externalplot commands'
 )
conflicts=('sollya')
provides=('sollya')
source=(git+https://scm.gforge.inria.fr/anonscm/git/sollya/sollya.git)
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_name"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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

