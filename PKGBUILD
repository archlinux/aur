# Maintainer: Hauke Rehfeld <aur@haukerehfeld.de>

pkgname=scare
pkgver=1.3.10
pkgrel=1
pkgdesc="SCARE is a secondary clone of jAsea, the Java GPL clone of the Adrift runner by Mark J. Tilford.  It aims to provide an ANSI/ISO C core Adrift interpreter."
arch=("any")
url="https://sites.google.com/site/scarehome/"
license=("GPLv2")

makedepends=()
depends=("glkterm")
conflicts=()
provides=("adrift4")

source=("${pkgname}-${pkgver}.zip::https://sites.google.com/site/scarehome/${pkgname}-${pkgver}.zip?attredirects=0")
md5sums=('5312c6d43e72c9b2800742b272901f9d')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}/"
	# DESTDIR="$pkgdir/" seems not to be supported
	make GLK=glkterm GLKDIR=/usr/include GLKPATH=/usr/include scare glkscare
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -Dm755 "source/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm755 "source/glk${pkgname}" "${pkgdir}/usr/bin/glk${pkgname}"
}
