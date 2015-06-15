# Maintainer: Wijnand Modderman-Lenstra <maze@pyth0n.org>
# Contributor: Vitaliy Berdinskikh <ur6lad@archlinux.org.ua>

pkgname=hamlib
pkgver=1.2.15.3
pkgrel=2
pkgdesc="Ham radio equipment control libraries"
arch=('i686' 'x86_64')
url="http://hamlib.org"
license=('GPL' 'LGPL')
depends=('perl' 'python2' 'tcl' 'libxml2' 'libusb')
makedepends=('libtool' 'swig')
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz)
options=('!emptydirs')
changelog=${pkgname}.ChangeLog.markdown

build() {
	export PYTHON=/usr/bin/python2

	cd $srcdir

	cd $pkgname-$pkgver

	./configure \
		--prefix=/usr \
		--sbindir=/usr/bin \
		--with-perl-binding \
		--with-python-binding \
		--enable-tcl-binding

	make
}

package() {
	cd $srcdir/$pkgname-$pkgver

	make DESTDIR=$pkgdir install

	# fix perl module location
	cd $pkgdir/usr/lib/perl5/site_perl/
	mkdir current/
	mv auto current
	mv Hamlib.pm current
	rm perltest.pl

	/usr/bin/find $pkgdir -name '.packlist' -delete
	/usr/bin/find $pkgdir -name '*.pod' -delete
}

md5sums=('3cad8987e995a00e5e9d360e2be0eb43')
sha256sums=('a2ca4549e4fd99d6e5600e354ebcb57502611aa63c6921c1b8a825289833f75e')
