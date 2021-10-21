# Maintainer: Bernhard Walle <bernhard.walle@posteo.eu>

_pkgname=swisswatch
pkgname=${_pkgname}-git
pkgver=20211019.43a1c9e
pkgrel=2
pkgdesc='X11 clock that looks like a station clock in Switzerland'
url='https://github.com/sleinen/swisswatch'
arch=('i686' 'x86_64' 'armv7h' 'armv6h')
license=('custom:MIT')
makedepends=('git' 'libxt' 'libxmu')
source=("${pkgname}::git+https://github.com/bwalle/swisswatch.git#branch=simple-makefile")
sha1sums=('SKIP')

provides=("${pkgname}")
conflicts=("${pkgname}" "${_pkgname}")

pkgver() {
	cd "${srcdir}/${pkgname}"
	git log -1 --format='%cd.%h' --date=short | tr -d -
}

build() {
	cd "${srcdir}/${pkgname}"
	make -f Makefile.simple
}

package() {
	cd "${srcdir}/${pkgname}"
	install -Dm755 swisswatch "${pkgdir}/usr/bin/swisswatch"
	gzip swisswatch.man
	install -Dm644 swisswatch.man.gz "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
	install -Dm644 SWatch.ad "${pkgdir}/usr/share/X11/app-defaults/SwissWatch"
	install -Dm644 SWatch-co.ad "${pkgdir}/usr/share/X11/app-defaults/SwissWatch-color"
}
