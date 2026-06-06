# Maintainer: Xuelin Yang <xuelin@adamanteye.cc>
pkgname=astroimagej-bin
pkgver=6.0.8.00
pkgrel=1
pkgdesc="A simple and powerful tool for astronomical image analysis and precise photometry."
arch=('x86_64')
url="https://github.com/AstroImageJ/astroimagej"
license=('GPL')
depends=(
	'alsa-lib'
	'glibc'
	'libx11'
	'libxext'
	'libxi'
	'libxrender'
	'libxtst'
)
provides=("astroimagej=${pkgver}")
conflicts=('astroimagej')
options=('!strip')
source=(
	"AstroImageJ-${pkgver}-linux-x64.tgz::${url}/releases/download/${pkgver}/AstroImageJ-${pkgver}-linux-x64.tgz"
	"astroimagej.desktop"
)
sha256sums=(
	'af4a09d2d01d5a6a510200fdf971d251a782b14a5874d24298f747b74acb2869'
	'af13f0eae5cd27d52dc2a8a2fb574840feafc0ca7d6c7c983bb0123485e0ca8b'
)

package() {
	cd "${srcdir}/astroimagej"

	install -dm755 "${pkgdir}/opt/astroimagej"
	cp -a . "${pkgdir}/opt/astroimagej/"

	install -Dm644 "${srcdir}/astroimagej.desktop" "${pkgdir}/usr/share/applications/astroimagej.desktop"
	install -Dm644 "lib/AstroImageJ.png" "${pkgdir}/usr/share/pixmaps/astroimagej.png"

	install -dm755 "${pkgdir}/usr/bin"
	ln -s "/opt/astroimagej/bin/AstroImageJ" "${pkgdir}/usr/bin/aij"
}
