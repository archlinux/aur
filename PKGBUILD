# Maintainer: Stephen Brown II <Stephen [dot] Brown2 [at] gmail.com>
pkgname=stoken
pkgver="0.90"
pkgrel=1
pkgdesc="RSA SecurID-compatible software token for Linux/UNIX systems"
arch=('i686' 'x86_64')
url="https://github.com/cernekee/${pkgname}"
license=('LGPL2.1')
depends=('nettle' 'libxml2')
optdepends=('gtk3: required for stoken-gui')
conflicts=("${pkgname}-git")
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz.asc")
md5sums=('3c74bb0599085b5de9aa600fa3270ae3'
         'f064bc11a4e825ec7ddffc3eaf1fe247')
validpgpkeys=('45DFF2D5205FE8CD74C2EE6C63B81599BC0B0D65')

build() {
	cd "${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}

check() {
	cd "${pkgname}-${pkgver}"
	make -k check
}

package() {
	cd "${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}/" install
}
