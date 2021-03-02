# Contributor: Wido <widomaker2k7 [at] gmail [dot] com>
# Maintainer: andy123 < ajs [at] online [dot] de >

pkgname=nottetris2
pkgver=2
pkgrel=2
pkgdesc="Basically it's a little like tetris except with a twist."
arch=('any')
url="http://stabyourself.net/nottetris2/"
license=('CCPL:by-nc-sa')
depends=('love07')
_gamepkg="${pkgname}-linux.zip"
source=(${pkgname}.sh
	${pkgname}.desktop
	https://stabyourself.net/dl.php?file=nottetris2/${_gamepkg})
sha1sums=('390774029be6f1e41595224eeedf3da4a693d5da'
          'd745399c1d55c35e83b103126fcf291e46e0b160'
          '604801636a94147dccfdbe73489a68cbd68a88ac')

build() {
	mkdir -p temp
	cd temp
	bsdtar -xvf "${srcdir}/Not Tetris 2.love"
	sed -i 's/math.mod/math.fmod/g' *.lua
	bsdtar -cv --format zip -f ../temp.zip *
	cd ..
	mv -v temp.zip "${srcdir}/Not Tetris 2.love"
}

package() {
	# Install Data
	install -D -m755 "${srcdir}/Not Tetris 2.love" "${pkgdir}/usr/share/games/${pkgname}/${pkgname}.love"
	install -D -m644 "${srcdir}/Not Readme.txt" "$pkgdir/usr/share/games/${pkgname}/readme"

	# Install Launcher
	install -D -m755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

	# Install Desktop
	install -D -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
