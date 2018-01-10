# Maintainer: Stephen Brown II <Stephen [dot] Brown2 [at] gmail.com>
pkgname=stoken
pkgver="0.92"
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
sha256sums=('aa2b481b058e4caf068f7e747a2dcf5772bcbf278a4f89bc9efcbf82bcc9ef5a'
            'd5dfabaa93dae1e9f91f3bb5093eb1d7d6d4b85a92d8adc63c2a23f949b01b3c')
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
