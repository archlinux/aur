# Maintainer: David Hummel <david dot hummel at gmail point com>

pkgname=sndpeek
pkgver=1.41
pkgrel=1
pkgdesc="a real-time audio visualization tool (animated, 3D)"
arch=("i686" "x86_64")
url="https://www.gewang.com/software/${pkgname}"
groups=("multimedia")
license=("GPL")
depends=("libsndfile" "alsa-lib" "glu" "freeglut" "libxmu")
provides=("sndpeek-alsa" "sndpeek-jack")
conflicts=("sndpeek-alsa" "sndpeek-jack")
source=("$url/files/${pkgname}-${pkgver}.tgz")
sha256sums=("65530b6510d07c2088e5ffa2e4b11bdf8b872aa893913da96b6b018e74b24e4d")
_srcdir="${pkgname}-${pkgver}/src/${pkgname}"

build() {
	for CONF in "alsa" "jack"
	do
		make --directory="${_srcdir}" clean
		make --directory="${_srcdir}" linux-${CONF}
		mv "${_srcdir}/${pkgname}" "${_srcdir}/${pkgname}-${CONF}"
	done
}

package() {
	mkdir -p "${pkgdir}/usr/bin"
	for CONF in "alsa" "jack"
	do
		install -p -D "${_srcdir}/${pkgname}-${CONF}" -m 0755 "${pkgdir}/usr/bin/${pkgname}-${CONF}"
	done
}
