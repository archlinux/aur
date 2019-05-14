# Maintainer: Daniel Peukert <dan.peukert@gmail.com> (original PKGBUILD by mortzu and zizzfizzix)
pkgname='cloudprint-cups-git'
pkgver='20160502.r15.gad53b23'
pkgrel='3'
epoch='1'
pkgdesc='Google Cloud Print driver for CUPS, allows printing to printers hosted on Google Cloud Print. (git version)'
arch=('any')
url='https://github.com/simoncadman/CUPS-Cloud-Print'
license=('GPL3')
depends=('python2' 'python2-pycups' 'python2-httplib2' 'python2-six')
makedepends=('cups' 'git')
provides=('cloudprint-cups' 'cupscloudprint')
conflicts=('cloudprint-cups' 'cupscloudprint')
options=(!emptydirs)
install=cloudprint-cups.install
source=("$pkgname::git://github.com/simoncadman/CUPS-Cloud-Print.git#branch=capabilities-fix")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$pkgname"
	./configure --prefix /usr
	make
}

package() {
	cd "$srcdir/$pkgname"
	NOPERMS=1 make DESTDIR="$pkgdir" install
}
