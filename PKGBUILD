# Maintainer: Sebastian Wolf <fatmike303 at gmail dot com>
pkgname=ndefpack
pkgver=1.0.1
pkgrel=1
pkgdesc="A pack of tools for creating EasyFlash cartridge images"
arch=(i686 x86_64)
url="https://csdb.dk/release/?id=109269"
license=('GPL')
depends=('fltk')
source=(http://sourceforge.net/projects/${pkgname}/files/${pkgname}-${pkgver}.tar.gz)
sha256sums=('03c0feedac206912e3210474a30860a3130f1b01d618b4b32de11d8230ab4937')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --without-firmware && make || return 1
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	pwd
	install -D -m755 src/ndeft ${pkgdir}/usr/bin/ndeft || return 1
	install -D -m755 src/ndefgui ${pkgdir}/usr/bin/ndefgui || return 1
	install -D -m644 COPYING ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE || return 1
	install -D -m644 COPYING_fw ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE_FIRMWARE || return 1
}
