# Maintainer: grufo <madmurphy333 AT gmail DOT com>

_framework='taler'
_module='merchant'

pkgname="${_framework}-${_module}"
pkgver='0.9.2'
pkgrel=1
pkgdesc='Merchant logic implementation(s) and support code'
arch=('i686' 'x86_64')
url="https://${_framework}.net/"
license=('AGPL' 'GPL' 'LGPL')
groups=("${_framework}")
conflicts=("${pkgname}-git" "${pkgname}-bin")
depends=('jansson' 'libgcrypt' 'postgresql' 'gnunet' 'qrencode'
         'taler-exchange')
source=("http://ftp.gnu.org/gnu/${_framework}/${pkgname}-${pkgver}.tar.gz"{,.sig})
validpgpkeys=('D8423BCB326C7907033929C7939E6BE1E29FC3CC')
sha256sums=('f861fad36426708e1d3d95be1b5d4d6f75e62a575fc07c527c33acd36299a659'
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

