# Contributor: Anton Leontiev <scileont /at/ gmail.com>
# Contributor: Matthias Blaicher <matthias /at/ blaicher.com>
pkgname=gaussianbeam-svn
pkgver=r140
pkgrel=1
pkgdesc="Gaussian optics simulator"
arch=('i686' 'x86_64')
url='http://gaussianbeam.sourceforge.net/'
license=('GPL')
depends=('qt4>=4.4')
makedepends=('subversion')
provides=('gaussianbeam')
conflicts=('gaussianbeam')
source=("${pkgname}::svn+svn://svn.code.sf.net/p/gaussianbeam/code/")
sha512sums=('SKIP')

pkgver() {
	cd $pkgname
	local ver="$(svnversion)"
	printf "r%s" "${ver//[[:alpha:]]}"
}

build() {
	mkdir -p $pkgname-build
	cd $pkgname-build

	cmake ../$pkgname
	make
}

package() {
	install -D -m755 $pkgname-build/gaussianbeam "$pkgdir/usr/bin/gaussianbeam"
}
