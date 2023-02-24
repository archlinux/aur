# Maintainer: Florian Dejonckheere <florian at floriandejonckheere dot be>
# Contributor: goodmen <goodmenlinux@gmail.com>
# Contributor: Gergely Imreh <imrehgATgmailDOTcom>
# Originally contributed by champus, madeye, Ranguvar and ninja_pt

pkgname=ipmiutil
pkgver=3.1.8
pkgrel=1
pkgdesc="A simple program that lists results from the hardware detection library."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/ipmiutil/"
license=('BSD')
depends=('openssl')
conflicts=('renameutils')
options=('!emptydirs')
source=("http://prdownloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('b38ef567b6bb8a24418e448f23115190')

build()
{
	cd "${srcdir}/${pkgname}-${pkgver}"

	./configure --enable-gpl --libdir=/usr/lib --bindir=/usr/bin
	make
}

package()
{
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install

	mv -v "${pkgdir}"/usr/sbin/* "${pkgdir}/usr/bin/"
	rmdir -v "${pkgdir}/usr/sbin/"

	install -Dm644 "${srcdir}/${pkgname}-${pkgver}/COPYING" "${pkgdir}/usr/share/licenses/ipmiutil/LICENSE"
}
