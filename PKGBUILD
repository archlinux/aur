# Maintainer: grufo <madmurphy333 AT gmail DOT com>

_framework='taler'
_module='mdb'

pkgname="${_framework}-${_module}"
pkgver='0.9.3'
pkgrel=1
pkgdesc='Sales integration with the Multi-Drop-Bus of Snack machines, NFC readers and QR code display'
arch=('i686' 'x86_64')
url="https://${_framework}.net/"
license=('GPL')
groups=("${_framework}")
conflicts=("${pkgname}-git" "${pkgname}-bin")
depends=('libnfc' 'libcurl-gnutls' 'libusb' 'jansson' 'gnunet' 'taler-exchange' 'taler-merchant')
optdepends=('qrencode: for QR Code generation')
source=("http://ftp.gnu.org/gnu/${_framework}/${pkgname}-${pkgver}.tar.gz"{,.sig})
validpgpkeys=('D8423BCB326C7907033929C7939E6BE1E29FC3CC')
sha256sums=('336d2d0405efe15cbc69bbe3cb7a417f0bdc1738768c965664c978a9f83b8a61'
            'SKIP')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}

check() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make check
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}

