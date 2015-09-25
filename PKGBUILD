# Maintainer: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: fstirlitz <felix.von.s@posteo.de>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Matej Lach <matej.lach@gmail.com>

pkgname=birdfont
pkgver=2.12.0
pkgrel=1
pkgdesc='A free font editor that lets you create vector graphics and export TTF, EOT & SVG fonts'
arch=('i686' 'x86_64')
url='https://birdfont.org/'
license=('GPL3')
depends=('libgee' 'webkitgtk' 'libnotify' 'libxmlbird' 'ttf-roboto')
makedepends=('vala' 'gettext' 'python')
source=(
	https://birdfont.org/releases/${pkgname}-${pkgver}.tar.xz{,.sig}
	'http://www.unicode.org/Public/UNIDATA/NamesList.txt'
)
sha512sums=(
	'65209b66df6c4c9980396c55b5862c9eee06a26302d4e0f3a3ce89ce3d7c4b6e1d2adda5315a553696336afab78732634a75fdd31ae01965934b37d6034e06d2'
	'SKIP'
	'7f9fb0349f64e8c84d1d2fa3416d561b30744d6f1fcb7d01efe1bc93dca2fe7f58148918270bfeb92551a1e08c7fefba3208af259bf35d8653a1c7772b8da259'
)
validpgpkeys=('FB3BEFA59A6FF7F0E0682B68BCD31D4CCCEB9DD4') # Johan Mattsson <gmail: johan dot mattsson dot m>
install="${pkgname}.install"

build() {
	cd "${srcdir}/$pkgname-$pkgver"
	./configure -p /usr
	./scripts/linux_build.py -p /usr
}

package() {
	cd "${srcdir}/$pkgname-$pkgver"
	./install.py -d "${pkgdir}" -n /share/man -l /lib
	install -Dm644 '../NamesList.txt' \
		"${pkgdir}/usr/share/unicode/NamesList.txt"
	install -Dm644 "resources/linux/256x256/${pkgname}.png" \
		"${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
