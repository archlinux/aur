# Maintainer: Dan McCurry <dan.mccurry at linux dot com>
pkgname=qsoas
pkgver=2.1
pkgrel=1
pkgdesc="Open-source software developed to analyze electrochemical data and other one-dimensional signals."
arch=('i686' 'x86_64')
url="http://bip.cnrs-mrs.fr/bip06/qsoas"
license=('GPL2')
depends=('ruby' 'qt4' 'gsl')
provides=('qsoas')
conflicts=('qsoas')
install=
source=("http://bip.cnrs-mrs.fr/bip06/qsoas/downloads/${pkgname}-${pkgver}.tar.gz"
	"${pkgname}.desktop")
md5sums=('4d8a46e1d53f64eace22aaa717200a51'
         '05857d790bc8bb91efcaf95f72ec2d7a')

build() {
	cd "$pkgname-$pkgver"
	qmake-qt4
	make
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm644 ../${pkgname}.desktop \
		${pkgdir}/usr/share/applications/${pkgname}.desktop
	install -Dm644 ./QSoas-logo.png \
		${pkgdir}/usr/share/pixmaps/${pkgname}.png
	install -Dm755 ./QSoas ${pkgdir}/usr/bin/${pkgname}
}
