# Maintainer: calamity <calamity dot aur at mailban dot de>
# Contributor: Runnytu < runnytu at gmail dot com >
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: tobias <tobias@archlinux.org>
# Contributor: Tobias Kieslich <tobias@justdreams.de>

pkgname=courier-maildrop-minimal
_srcname=maildrop
pkgver=3.1.8
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
sha512sums=('0ee8e36cc5464cbbbef60721da19de7a12b9aa4737e40039c421ee14494c53f87146d50d1b8ae64186d8330121d54a62092435cadb51c3dede31658ff5104eb8'
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
