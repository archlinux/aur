# Maintainer: Pietro Palmesi pietro _DOT_ palmesi _AT gmail _DOT_ com
# PKGBUILD from: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Scytrin dai Kinthra <scytrin@gmail.com>

pkgname=st-pizz
_pkgname=st
epoch=1
pkgver=20150923.821cdb0
pkgrel=1
pkgdesc='Simple virtual terminal emulator for X from Github. Customizations: Droid Sans font; base16'
url='https://github.com/pizzooid/st'
arch=('i686' 'x86_64' 'armv7h')
license=('MIT')
depends=('libxft' 'ttf-droid')
makedepends=('ncurses' 'libxext' 'git')
source=('git://github.com/pizzooid/st')
md5sums=('SKIP')
sha1sums=('SKIP')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git log -1 --format='%cd.%h' --date=short | tr -d -
}

build() {
	cd "${srcdir}/${_pkgname}"
	#remove the terminfo, because it is provided by ncurses
	make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
	cd "${srcdir}/${_pkgname}"
	make PREFIX=/usr DESTDIR="${pkgdir}" TERMINFO="$pkgdir/usr/share/terminfo" install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 README.md "${pkgdir}/usr/share/licenses/${pkgname}/README"
}
md5sums=('SKIP')
