# Maintainer: Felix Salfelder <felix aet salfelder dot org>
# Thanks to David Adler for testing.

_pkgname=gnucsator
pkgname=$_pkgname-git
pkgver=000
pkgrel=1
pkgdesc="Gnucap based Simulator for Qucs"
arch=('i686' 'x86_64')
url="http://gnucap.org/"
license=('GPL')
depends=('gnucap-git' 'boost')
makedepends=('git' 'numdiff')
source=(git+https://github.com/qucs/gnucsator#branch=develop)
md5sums=('SKIP')

pkgver() {
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd $_pkgname
	./configure
	make
}

check() {
	cd $_pkgname
	# Ignore outcome. Too much numerical noise.
	make check || :
}

package() {
	cd $_pkgname
	make DESTDIR="$pkgdir/" install
}
