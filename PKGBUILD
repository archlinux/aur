# Maintainer: grufo <madmurphy333 AT gmail DOT com>

_framework='taler'
_module='mdb'

pkgname="${_framework}-${_module}"
pkgver='0.9.4'
pkgrel=1
pkgdesc='Sales integration with the Multi-Drop-Bus of Snack machines, NFC readers and QR code display'
arch=('i686' 'x86_64')
url="https://${_framework}.net/"
license=('GPL')
groups=("${_framework}")
conflicts=("${pkgname}-git" "${pkgname}-bin")
depends=('libnfc' 'libcurl-gnutls' 'libusb' 'jansson' 'gnunet' 'taler-exchange' 'taler-merchant')
optdepends=('qrencode: for QR Code generation')
source=("ftp://ftp.gnu.org/gnu/${_framework}/${pkgname}-${pkgver}.tar.gz"{,.sig})
validpgpkeys=('D8423BCB326C7907033929C7939E6BE1E29FC3CC')
sha256sums=('22f4f17ef448a4b3b285db316ab50f90e798f662e75e0dbc747b4ca1857da476'
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

