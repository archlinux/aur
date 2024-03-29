# Maintainer: grufo <madmurphy333 AT gmail DOT com>

_framework='taler'

pkgname='sync'
pkgver='0.9.4'
pkgrel=1
pkgdesc='Backup and synchronization service'
arch=('i686' 'x86_64')
url="https://${_framework}.net/"
license=('AGPL')
groups=("${_framework}")
conflicts=("${pkgname}-git" "${pkgname}-bin")
depends=('gnunet' 'libmicrohttpd' 'postgresql' 'taler-exchange' 'taler-merchant')
source=("ftp://ftp.gnu.org/gnu/${_framework}/${pkgname}-${pkgver}.tar.gz"{,.sig})
validpgpkeys=('D8423BCB326C7907033929C7939E6BE1E29FC3CC')
sha256sums=('85037374ff8b21f819c45809bde8cbafc3828687ab4b4c0a807dc5621b26fb83'
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

