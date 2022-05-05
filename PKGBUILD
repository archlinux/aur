# Maintainer: grufo <madmurphy333 AT gmail DOT com>
# Contributor: TheJackiMonster <thejackimonster AT gmail DOT com>

_framework='gnunet'
pkgname='libgnunetchat'
pkgver='0.1.0'
pkgrel=1
pkgdesc='GNUnet chat library'
arch=('i686' 'x86_64')
url="http://${_framework}.org"
license=('AGPL')
conflicts=("${pkgname}-bin" "${pkgname}-git")
provides=("${pkgname}")
depends=("${_framework}")
options=('!makeflags' '!buildflags')
source=("https://ftp.gnu.org/gnu/${_framework}/${pkgname}-${pkgver}.tar.gz"{,.sig})
validpgpkeys=('3D11063C10F98D14BD24D1470B0998EF86F59B6A')
sha256sums=('828614072b860f539b5b1af6f77afe1ef38be4a53d0542827071f5b47eb5d04a'
            'SKIP')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -dm755 "${pkgdir}/usr"
	install -dm755 "${pkgdir}/lib"
	install -dm755 "${pkgdir}/include/gnunet"
	make INSTALL_DIR="${pkgdir}/" install
	mv "${pkgdir}/include" "${pkgdir}/usr"
	mv "${pkgdir}/lib" "${pkgdir}/usr"
}
