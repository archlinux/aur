# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgname='ots'
pkgver='6.1.1'
pkgrel='1'
pkgdesc='OpenType fonts sanitiser. Supports TTF, WOFF, WOFF2 and other formats'
arch=('i686' 'x86_64')
url='https://github.com/khaledhosny/ots'
license=('custom')
depends=('freetype2')
conflicts=('ots-git')
source=("${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('d7c6f77496a4b0867731e066d6c33642141b7a2ec3c4c4b323e4a350331d0360d4c58e7c8a9e996afb15dc150e62a98a5c484e25be9da2d6cbcd3b32fdd6bc9b')

build() {
	cd "${pkgname}-${pkgver}"
	./configure --prefix=/usr --libdir=/usr/lib
	make
}

package() {
	cd "${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
  	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	# Remove stray static libraries and headers.
	rm -rf "${pkgdir}/usr"/{lib,include}
}
