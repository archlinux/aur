# Maintainer: Cameron Reikes<cameronreikes@gmail.com>

pkgname=jevois-inventor
pkgver=0.5.0
pkgrel=5
pkgdesc="An easy to use GUI for programming the Jevois smart camera"
arch=('i686' 'x86_64')
url="https://github.com/jevois/jevois-inventor"
license=('GPL3')
depends=('qt5-serialport' 'qt5-multimedia' 'gst-plugins-bad')
makedepends=('git' 'qt5-base')
provides=("${pkgname}")
source=("https://github.com/jevois/jevois-inventor/archive/${pkgver}.tar.gz"
	"https://i.imgur.com/TgKOknB.png"
	"${pkgname}.desktop")
sha256sums=('d468cd9e6f603f7e9236b775cd1f8267dad7256263db93062932123904e899aa'
	'fa1038a63572327f680c68e89fbc6b35a249037232957388538fdba44227a185'
	'SKIP')

prepare() {
	cd "$srcdir/${pkgname}-${pkgver}"
}

build() {
	cd "$srcdir/${pkgname}-${pkgver}"
	qmake-qt5 -config release
	make
}

check() {
	cd "$srcdir/${pkgname}-${pkgver}"
	make -k check
}

package() {
	cd "$srcdir/${pkgname}-${pkgver}"
	install -D -m644 "$srcdir/TgKOknB.png" "${pkgdir}/usr/share/icons/${pkgname}.png"
	install -D -m644 "$srcdir/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -D -m755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

