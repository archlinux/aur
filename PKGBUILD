# Maintainer: Genstar <genstar@disroot.org>
pkgname=wapua
_name=wApua
_icon_orig="${_name}.jpeg"
_icon_new="${_name}.png"
pkgver=0.06.4
pkgrel=1
#epoch=
pkgdesc="A WAP Browser written in Perl/Tk"
arch=('x86_64')
url="https://fsinfo.noone.org/~abe/wApua"
license=('GPL-2.0-only')
#groups=()
depends=('perl>=5.6' 'perl-libwww>=5.22' 'perl-tk>=800.012')
makedepends=('imagemagick')
#checkdepends=()
#optdepends=()
#provides=()
#conflicts=()
#replaces=()
#backup=()
#options=()
#install=
#changelog=
source=(
	"https://fsinfo.noone.org/~abe/wApua/${_name}-${pkgver}.tar.gz"
	"${_icon_orig}::https://fsinfo.noone.org/~abe/wApua/images/wApua-Logo.70.jpeg"
	"${pkgname}.desktop")
noextract=()
sha256sums=(
	'2d4d3b4402c0c31715d951100420ce3a2a6ff553cedee5d2d8ff15b51eae525d'
	'54a4fc3780028a5a9f5b6b11f24ad0c548e5684aefee8bda7167eeeff7cf0869'
	'b5d95a89e2009ad9d518e982cf14ee3fd680d637eae1356e513e70201dec0236')
#validpgpkeys=()

build() {
	magick "${_name}-${pkgver}/${_name}/images/${_name}.wbmp" -gravity center -background white -extent 96x96 96x96.png
	magick "${_name}-${pkgver}/${_name}/images/${_name}.wbmp" -gravity center -background white -extent 128x128 128x128.png
	magick "${_icon_orig}" -gravity center -background white -resize 256x256 -extent 256x256 256x256.png
	magick "${_icon_orig}" -gravity center -background white -resize 512x512 -extent 512x512 512x512.png
	cd "${_name}-${pkgver}"
	perl Makefile.PL
	make
}

package() {
	install -Dm444 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -Dm444 "96x96.png" "${pkgdir}/usr/share/icons/hicolor/96x96/apps/${_icon_new}"
	install -Dm444 "128x128.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${_icon_new}"
	install -Dm444 "256x256.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_icon_new}"
	install -Dm444 "512x512.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_icon_new}"
	cd "${_name}-${pkgver}"
	make DESTDIR="${pkgdir}/" install
	ln -s "${pkgdir}/usr/bin/site_perl/wApua" "${pkgdir}/usr/bin/wApua"
}
