# Contributor: Johannes Dewender  arch at JonnyJD dot net
pkgname=pnapi
pkgver=4.03
pkgrel=1
pkgdesc="C++ library encapsulating Petri net-related functions"
arch=('i686' 'x86_64')
url="http://service-technology.org/pnapi/"
license=('AGPL3')
depends=('petrify')
checkdepends=()
optdepends=('graphviz: for svg output with petri'
	'lola1: to use the cdnf tool')
options=()
backup=(etc/petri.conf)
install=pnapi.install
source=(http://download.gna.org/service-tech/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('2235be39b1c0615ded0197e57661a5127337681f034a8d29bed833f376c8a836')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

check() {
	cd "$srcdir/$pkgname-$pkgver"
	# not all tests work or are intended for general use
	cd "tests"
	make check-frontend
	make check-woflan
	make check-ina
	make check-reduction
	make check-roles
	make check-condition
	make check-canonical_names
	make check-automaton
	make check-generator
	make check-configurator
	make check-formulae
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install

	mv $pkgdir/usr/etc $pkgdir/
}
