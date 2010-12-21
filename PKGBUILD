# Contributor: Olivier Mehani <olivier.mehani@inria.fr>
# $Id$
# Mostly based on the Gentoo ebuild
# http://sources.gentoo.org/viewcvs.py/gentoo-x86/app-arch/ipkg-utils/ipkg-utils-1.7.050831.ebuild?rev=1.3&view=markup

pkgname=ipkg-utils
pkgver=050831
pkgrel=2
pkgdesc="The Itsy Package Management System utils"
url="http://handhelds.org/moin/moin.cgi/Ipkg"
source=(http://www.handhelds.org/download/packages/${pkgname}/${pkgname}-${pkgver}.tar.gz
ipkg-utils-050831.destdir.patch
python-param.patch
)
depends=(python2)
makedepends=(python2)

arch=('any')
license=('GPL')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	patch -Np1 < ../ipkg-utils-050831.destdir.patch
	patch -p1 < ../python-param.patch
	make
}

package() {
	make -C "$srcdir/$pkgname-$pkgver" DESTDIR="$pkgdir" PREFIX=/usr \
		install
}

md5sums=('4ede7edd4bcb69d9a0b74af2f68fd6da'
         'f53ad35c8ea36dd42aeb2edf0c81df34'
         '09ae06c8f5c3be87eb41d003fdcf63c1')
