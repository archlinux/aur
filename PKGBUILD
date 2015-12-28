# Maintainer: Maxime de Roucy <maxime.deroucy@gmail.com>
# Contributor: David Manouchehri <manouchehri@riseup.net>

pkgname=pam_u2f
pkgver=1.0.3
pkgrel=1
pkgdesc="Universal 2nd Factor (U2F) PAM authentication module from Yubico"
arch=('i686' 'x86_64')
url='https://developers.yubico.com/pam-u2f/'
license=('BSD')
depends=('libu2f-host' 'libu2f-server')
makedepends=('asciidoc')
source=("https://developers.yubico.com/${pkgname/_/-}/Releases/${pkgname}-${pkgver}.tar.gz")
sha256sums=('fed38c26c2bec86d49dbe9046d5a34906396e97799ebb1f64f5354d7f0490b37')

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
