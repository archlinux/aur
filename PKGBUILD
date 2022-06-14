# Maintainer: Manuel Hüsers <aur@huesers.de>
# Contributor: gruenfron <https://aur.archlinux.org/account/gruenfron>
# Contributor: Jose Riha <jose1711 gmail com>
# Contributor: archtux <antonio dot arias99999 at gmail dot com>

pkgname=bino
pkgver=1.6.8
pkgrel=4
pkgdesc='3D video player with multi-display support'
arch=('x86_64')
url='https://bino3d.org/'
license=('GPL3')
depends=('ffmpeg4.4' 'freealut' 'freeglut' 'glewmx' 'libass' 'qt5-base')
optdepends=('lirc: infrared remote control')
source=(https://bino3d.org/releases/${pkgname}-${pkgver}.tar.xz{,.sig}
	ffmpeg4.4.patch)
sha512sums=('d8cf5be356add4ed3fb36673038b5ffd92d0dc840798cc616fa4b11fec221c7f114347dfc7cdb7a3a24c5599b56301cddc99f84d3862d8e874612960281319cc'
	'SKIP'
	'f7bf716a6ae12a4542ecaddeaee1078a6c26d9d765db7cc11a1d7b1ae19b295703f5b05e71564f1aad216485b904d81f2670c122e88ab79c7556f5614c0d1639')
validpgpkeys=('2F61B4828BBA779AECB3F32703A2A4AB1E32FD34')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	patch -Np1 -i '../ffmpeg4.4.patch'
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure \
	  --prefix=/usr \
	  --with-qt-version=5 \
	  #--with-xnvctrl # Enable NVIDIA Quadro SDI output
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
