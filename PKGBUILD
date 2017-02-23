# Maintainer: Stephen Brown II <Stephen [dot] Brown2 [at] gmail.com>
pkgname=stoken
pkgver="0.91"
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
sha256sums=('419ed84000bc455ef77c78e3ebfd4c6fd2d932384563989f864becbafd51bcf4'
            '4be1f1c43804bf7fb1c6f2d5d9d72b1df928cd641b157f975aff1f4c6fe6b5f5')
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
