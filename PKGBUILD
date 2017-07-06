# $Id: PKGBUILD 186648 2013-05-30 12:12:51Z tomegun $
# Mantainer: Tom Gundersen <teg@jklm.no>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=yp-tools
pkgver=2.14
pkgrel=3
pkgdesc='Linux NIS Tools'
arch=('i686' 'x86_64')
url='http://www.linux-nis.org/nis/yp-tools/'
license=('GPL2')
depends=('ypbind-mt')
backup=('etc/nisdomainname')
install=yp-tools.install
source=("http://www.linux-nis.org/download/${pkgname}/${pkgname}-${pkgver}.tar.bz2"
	'domainname.service'
	'domainname.conf')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
	install -D -m644 ../domainname.conf "${pkgdir}/etc/nisdomainname"
	install -D -m644 ../domainname.service "${pkgdir}/usr/lib/systemd/system/domainname.service"
	# usrmove
	cd "$pkgdir"
	mv usr/sbin/* usr/bin
	rmdir usr/sbin
}
md5sums=('ba1f121c17e3ad65368be173b977cd13'
         '5a78cd2218936241133e5f61383a2dc8'
         '74298e047121f528a2a5c221afd783ab')
