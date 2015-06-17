# Maintainer: Maxime de Roucy <maxime.deroucy@gmail.com>

pkgname=pam_u2f
pkgver=1.0.0
pkgrel=1
pkgdesc="Universal 2nd Factor (U2F) PAM authentication module from Yubico"
arch=('i686' 'x86_64')
url='https://developers.yubico.com/pam-u2f/'
license=('BSD')
depends=('libu2f-host' 'libu2f-server')
makedepends=()
source=("https://developers.yubico.com/${pkgname/_/-}/Releases/${pkgname}-${pkgver}.tar.gz")

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

sha256sums=('79bb1bb9bdeececa0bcbd611519240560c9eca7608108b17be0519d7980dae07')
