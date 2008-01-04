# Contributor: Olivier Mehani <olivier.mehani@inria.fr>
# $Id$
# Mostly based on the Gentoo ebuild
# http://sources.gentoo.org/viewcvs.py/gentoo-x86/app-arch/ipkg-utils/ipkg-utils-1.7.050831.ebuild?rev=1.3&view=markup

pkgname=ipkg-utils
pkgver=050831
pkgrel=1
pkgdesc="The Itsy Package Management System utils"
url="http://handhelds.org/moin/moin.cgi/Ipkg"
source=(http://www.handhelds.org/download/packages/${pkgname}/${pkgname}-${pkgver}.tar.gz
ipkg-utils-050831.destdir.patch)
makedepends=(python)
md5sums=('4ede7edd4bcb69d9a0b74af2f68fd6da'
'f53ad35c8ea36dd42aeb2edf0c81df34')
arch=('i686')
license=('GPL')

build() {
	cd $startdir/src/$pkgname-$pkgver
	patch -Np1 < $startdir/src/ipkg-utils-050831.destdir.patch
	make || exit 2

	mkdir -p $startdir/pkg/usr/bin
	make DESTDIR=$startdir/pkg PREFIX=/usr install || exit 3
}
