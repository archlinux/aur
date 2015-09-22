# Maintainer: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: fstirlitz <felix.von.s@posteo.de>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Matej Lach <matej.lach@gmail.com>

pkgname=birdfont
pkgver=2.11.7
pkgrel=1
pkgdesc='A free font editor that lets you create vector graphics and export TTF, EOT & SVG fonts'
arch=(i686 x86_64)
url='https://birdfont.org/'
license=('GPL3')
depends=('libgee' 'webkitgtk' 'libnotify' 'libxmlbird' 'ttf-roboto')
makedepends=('vala' 'gettext' 'python')
source=(
	"https://birdfont.org/releases/${pkgname}-${pkgver}.tar.xz"
	"https://birdfont.org/releases/${pkgname}-${pkgver}.tar.xz.sig"
	'http://www.unicode.org/Public/UNIDATA/NamesList.txt'
	'fix_install.patch'
)
sha512sums=(
	'd476497ef6fa8f336820f3c35deb53eed4cdd3db58522c707d689195dcd81962db45527f45ab034b2263b220e160ab5924e22bcf8d936da42c5695b28d4c3053'
	'SKIP'
	'7f9fb0349f64e8c84d1d2fa3416d561b30744d6f1fcb7d01efe1bc93dca2fe7f58148918270bfeb92551a1e08c7fefba3208af259bf35d8653a1c7772b8da259'
	'b8d286db7d56e89045b57f93e712487c9422560c744792326799f3c58fcca2b33bb1cf4c2fe95c693ba1a28b8cfb49f12eea5b59e63cb594e4e8a4f7b5a0e13c'
)
validpgpkeys=('FB3BEFA59A6FF7F0E0682B68BCD31D4CCCEB9DD4') # Johan Mattsson <gmail: johan dot mattsson dot m>
install="${pkgname}.install"

prepare() {
	cd "${srcdir}/$pkgname-$pkgver"
	patch -p1 -i '../fix_install.patch'
}

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
