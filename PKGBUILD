# Contributor: Matej Lach <matej.lach@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=birdfont
pkgver=2.10.5
pkgrel=1
pkgdesc='A free font editor that lets you create vector graphics and export TTF, EOT & SVG fonts'
arch=(i686 x86_64)
url='http://birdfont.org/'
license=('GPL3')
depends=('libgee' 'webkitgtk' 'libnotify' 'libxmlbird')
makedepends=('vala' 'gettext' 'python2')
source=(
	"http://birdfont.org/releases/${pkgname}-${pkgver}.tar.xz"
	"http://birdfont.org/releases/${pkgname}-${pkgver}.tar.xz.sig"
	'http://www.unicode.org/Public/UNIDATA/NamesList.txt'
)
sha512sums=(
	'f72f0a0c6bfcdd14c67b8980770d4c24a89ebcd56a30fd62cecebe8e06e50e19f04326cba03a030897f45645e1a9bc8ff006ce89efb557630c535e08582c79bf'
	SKIP
	'7f9fb0349f64e8c84d1d2fa3416d561b30744d6f1fcb7d01efe1bc93dca2fe7f58148918270bfeb92551a1e08c7fefba3208af259bf35d8653a1c7772b8da259'
)
validpgpkeys=('FB3BEFA59A6FF7F0E0682B68BCD31D4CCCEB9DD4') # Johan Mattsson <gmail: johan dot mattsson dot m>
install=birdfont.install

prepare() {
	cd "${srcdir}/$pkgname-$pkgver"
	sed -i -e 's/gtk+-2.0/gtk+-3.0/g' ./scripts/build.py
}

build() {
	cd "${srcdir}/$pkgname-$pkgver"
	python2 ./configure -p /usr
	python2 ./scripts/linux_build.py -p /usr
}

package() {
	cd "${srcdir}/$pkgname-$pkgver"
	install -d -m 0755 "${pkgdir}/usr/share/unicode"
	python2 ./install.py -d "${pkgdir}" -n /share/man -l /lib
	install -m 0644 "${srcdir}/NamesList.txt" "${pkgdir}/usr/share/unicode"
}
