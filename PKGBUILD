# Maintainer: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: fstirlitz <felix.von.s@posteo.de>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Matej Lach <matej.lach@gmail.com>

pkgname=birdfont
pkgver=2.14.0
pkgrel=1
pkgdesc='A free font editor that lets you create vector graphics and export TTF, EOT & SVG fonts'
arch=('i686' 'x86_64')
url='https://birdfont.org/'
license=('GPL3')
depends=('libgee' 'webkitgtk' 'libnotify' 'libxmlbird' 'ttf-roboto')
makedepends=('vala' 'gettext' 'python')
source=(https://birdfont.org/releases/${pkgname}-${pkgver}.tar.xz{,.sig})
sha512sums=('202529ba84d596e1fa18b605441291593a9feaa61713138c00108983f77884b714439751dac4134e49471addd39c1b88705921dafdbe66733278ea324b3f9ea2'
            'SKIP')
validpgpkeys=('FB3BEFA59A6FF7F0E0682B68BCD31D4CCCEB9DD4') # Johan Mattsson <gmail: johan dot mattsson dot m>
install="${pkgname}.install"

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure -p /usr
	./build.py
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./install.py -d "${pkgdir}" -n /share/man -l /lib
	install -Dm644 "resources/linux/256x256/${pkgname}.png" \
		"${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
