# Maintainer: Maxime de Roucy <maxime.deroucy@gmail.com>
# Contributor: David Manouchehri <manouchehri@riseup.net>

pkgname=pam_u2f
pkgver=1.0.2
pkgrel=1
pkgdesc="Universal 2nd Factor (U2F) PAM authentication module from Yubico"
arch=('i686' 'x86_64')
url='https://developers.yubico.com/pam-u2f/'
license=('BSD')
depends=('libu2f-host' 'libu2f-server')
makedepends=('asciidoc')
source=("https://developers.yubico.com/${pkgname/_/-}/Releases/${pkgname}-${pkgver}.tar.gz")
sha512sums=('edffa19eae3df72816a5dc319ce94aa1d924770e7e62c666b8cb4c583bc4e2aee75200681e7ecfac47938bfaf390c60cca7983783e0e30ec1df30e12fc1d6e60')

build() {
	cd ${pkgname}-${pkgver}/

	./configure \
		--prefix=/usr \
		--with-pam-dir=/usr/lib/security
	make
}

check() {
	cd ${pkgname}-${pkgver}/

	make check
}

package() {
	cd ${pkgname}-${pkgver}/

	make DESTDIR="${pkgdir}/" install

	mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
	cp COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}

# vim:set et sw=2 sts=2 tw=80:
