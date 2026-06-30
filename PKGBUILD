# Maintainer: calamity <calamity dot aur at mailban dot de>
# Contributor: Runnytu < runnytu at gmail dot com >
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: tobias <tobias@archlinux.org>
# Contributor: Tobias Kieslich <tobias@justdreams.de>

pkgname=courier-maildrop-minimal
_srcname=maildrop
pkgver=4.0.2
pkgrel=1
pkgdesc="Mail delivery agent with filtering abilities"
arch=('x86_64')
url="https://www.courier-mta.org/maildrop/"
license=('GPL3')
depends=('courier-unicode' 'libidn2' 'pcre2')
optdepends=('courier-authlib: for LDAP, MySQL or PostgreSQL based mail authentication')
conflicts=('courier-maildrop' 'courier-mta')
source=("https://downloads.sourceforge.net/project/courier/${_srcname}/${pkgver}/${_srcname}-${pkgver}.tar.bz2"{,.sig})
validpgpkeys=('6EA6428B24FF7A696EF9A4838A60F828A23652E2')
sha512sums=('d02c7e9868441e0c4df3a9ada3616b9effe07bbb42ccd447ef301659e2b67ad6405aeec2a638015fa52dafbd0c1941cef930bd4211e364ef77ad4994d560b245'
            'SKIP')

build() {
	cd "${srcdir}/${_srcname}-${pkgver}"
	./configure --prefix=/usr \
		--sysconfdir=/etc/courier \
		--localstatedir=/var \
		--without-db
	make
}

package() {
	cd "${srcdir}/${_srcname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
	chmod u+s "${pkgdir}/usr/bin/maildrop"
}
