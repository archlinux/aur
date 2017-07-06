# $Id: PKGBUILD 259084 2016-02-12 01:37:04Z dreisner $
# Maintainer: Tom Gundersen <teg@jklm.no>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=ypbind-mt
pkgver=1.38
pkgrel=1
pkgdesc='Linux NIS daemon'
url='http://www.linux-nis.org/nis/ypbind-mt/'
license=('GPL2')
arch=('i686' 'x86_64')
makedepends=('networkmanager')
depends=('rpcbind' 'openslp' 'yp-tools' 'systemd')
backup=('etc/yp.conf')
source=("http://www.linux-nis.org/download/${pkgname}/${pkgname}-${pkgver}.tar.bz2"
        'ypbind.service')
md5sums=('094088c0e282fa7f3b3dd6cc51d0a4e1'
         '5ea205756731c2978cca4934141424bd')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	./configure \
		--prefix=/usr \
		--sbindir=/usr/bin

	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	make DESTDIR="${pkgdir}" install

	install -D -m644 etc/yp.conf "${pkgdir}"/etc/yp.conf
	install -D -m644 ../ypbind.service "${pkgdir}"/usr/lib/systemd/system/ypbind.service
	install -d -m755 "${pkgdir}"/var/yp/binding
}
