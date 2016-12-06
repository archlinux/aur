# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

pkgname=truepng
pkgver=0.6.2.2
_srcfile="TruePNG_$(echo ${pkgver} | sed 's/\.//g').zip"
_extractdir="${_srcfile%.*}"
pkgrel=1
pkgdesc="An advanced and very efficient PNG image optimizer with lossless and lossy modes (uses wine)"
arch=('i686' 'x86_64')
url="http://x128.ho.ua/pngutils.html"
license=('unknown')
depends=('wine')
options=('!strip')
source=("$_srcfile"::"http://x128.ho.ua/clicks/clicks.php?uri=${_srcfile}"
        "https://raw.githubusercontent.com/bermond/shellutils/master/image/${pkgname}")
noextract=("$_srcfile")
sha256sums=('9b0278547fff0398467919afb6095b30c7d77d422345b5fdd2cfcfe40a52948e'
            '7d384ac1d72d58a76cf529c4f86859f2baeadec4f04ec3e47f442ce57f4df701')

prepare() {
	mkdir -p "$_extractdir"
	cd       "$_extractdir"
	bsdtar -x -f ../"$_srcfile"
}

package() {
	install -D -m755 "$pkgname"                 "${pkgdir}/usr/bin/${pkgname}"
	install -D -m644 "$_extractdir"/TruePNG.exe "${pkgdir}/usr/share/${pkgname}/TruePNG.exe"
}
