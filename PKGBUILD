# $Id: PKGBUILD 185290 2013-05-12 23:48:19Z tomegun $
# Maintainer: Tom Gundersen <teg@jklm.no>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=ypserv
pkgver=2.31
pkgrel=2
pkgdesc='Linux NIS Server'
arch=('i686' 'x86_64')
url='http://www.linux-nis.org/nis/ypserv/'
license=('GPL2')
depends=('gdbm' 'openslp' 'inetutils' 'yp-tools')
optdepends=('gawk: for printcap support')
backup=('etc/ypserv.conf' 'etc/netgroup' 'var/yp/securenets')
source=("http://www.linux-nis.org/download/${pkgname}/${pkgname}-${pkgver}.tar.bz2"
        'ypxfrd.service'
        'yppasswdd.service'
	'ypserv.service')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr --sbindir=/usr/bin
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install

	install -D -m644 etc/netgroup "${pkgdir}"/etc/netgroup
	install -D -m644 etc/ypserv.conf "${pkgdir}"/etc/ypserv.conf
	install -D -m644 etc/securenets "${pkgdir}"/var/yp/securenets
	install -D -m644 ../ypxfrd.service "${pkgdir}"/usr/lib/systemd/system/ypxfrd.service
	install -D -m644 ../ypserv.service "${pkgdir}"/usr/lib/systemd/system/ypserv.service
	install -D -m644 ../yppasswdd.service "${pkgdir}"/usr/lib/systemd/system/yppasswdd.service
}
md5sums=('4537b8f0e917edca8f57b70b9cbc37f3'
         '0639cc2e8f667272335649eeede77206'
         '9ff147310a5b83749357b6587cccdf34'
         '89b8b608c81fd01bb81cdb551854833f')
