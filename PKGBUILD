# Maintainer: calamity <calamity dot aur at mailban dot de>
# Contributor: Runnytu < runnytu at gmail dot com >
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: tobias <tobias@archlinux.org>
# Contributor: Tobias Kieslich <tobias@justdreams.de>

pkgname=courier-maildrop-minimal
_srcname=maildrop
pkgver=4.0.5
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
sha512sums=('cb78fc43faed0dbcdde04f5b438dadad1200530ca22920e5792c46bfc6cda872c5d5efadd06c67acddc18dea226b73dcd24f26276a6b9e7390a0a1d12704c885'
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
