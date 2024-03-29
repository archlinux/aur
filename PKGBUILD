# Maintainer: grufo <madmurphy333 AT gmail DOT com>

_framework='taler'
_module='merchant'

pkgname="${_framework}-${_module}"
pkgver='0.9.4'
pkgrel=1
pkgdesc='Merchant logic implementation(s) and support code'
arch=('i686' 'x86_64')
url="https://${_framework}.net/"
license=('AGPL' 'GPL' 'LGPL')
groups=("${_framework}")
conflicts=("${pkgname}-git" "${pkgname}-bin")
depends=('jansson' 'libgcrypt' 'postgresql' 'gnunet' 'qrencode'
         'taler-exchange')
source=("ftp://ftp.gnu.org/gnu/${_framework}/${pkgname}-${pkgver}.tar.gz"{,.sig})
validpgpkeys=('D8423BCB326C7907033929C7939E6BE1E29FC3CC')
sha256sums=('19923291e047b1842b4f9b4a605a6277ee079910e0c9199b3d6395ef21eb7c9c'
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

