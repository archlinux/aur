# Maintainer: calamity <calamity dot aur at mailban dot de>
# Contributor: Runnytu < runnytu at gmail dot com >
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: tobias <tobias@archlinux.org>
# Contributor: Tobias Kieslich <tobias@justdreams.de>

pkgname=courier-maildrop-minimal
_srcname=maildrop
pkgver=3.1.7
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
sha512sums=('972f3891d6f1daca97971d6cc3e09e4f78ce7bf8bb4520ed2836b8d7d9394546d403a0dd709e6b2e34706f67aae2563523bbc0953a9971cc2107fc0838fa095e'
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
