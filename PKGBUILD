# Maintainer: Jesse Spangenberger <azulephoenix@gmail.com>
# Contributor: Tristelune <tristelune@archlinux.info>
pkgname=pdfstudio18
pkgver=18.4.0
pkgrel=2
pkgdesc="Review, annotate, and edit PDF Documents"
arch=('i686' 'x86_64')
url="http://www.qoppa.com/pdfstudio/"
license=('custom')
conflicts=('pdfstudio' 'pdfstudio12' 'pdfstudio11' 'pdfstudio8' 'pdfstudio9' 'pdfstudio10')
provides=('pdfstudio')
makedepends=('pacman>=4.2.0')
depends=('java-runtime>=6' 'gtk-update-icon-cache')

install=${pkgname}.install     
     
sha256sums=('5c4df9f594bb1d19c390355b8302e1da7dff6fa61e8ea13b0ed6d457f1b9d635'
            '14293ddd33ba2e710690f7c1e684df9bf4ca9d55c4f4493bcdef5727b2820480'
            '0a3c1c337a22228f3df28412ca65d45d0d8067b508cf7b1cf93810fc17c9b447')
sha256sums_i686=('0d1812ef437813abe301f5e09c61aae34cd713774c437b54b5f55f1663036644')
sha256sums_x86_64=('cff644247811460db10d234cbe1387b80164844f216d41dff7dfd36863db4a7d')
source_i686=("https://download.qoppa.com/pdfstudio/v2018/PDFStudio_v2018_4_0_linux.deb")
source_x86_64=("https://download.qoppa.com/pdfstudio/v2018/PDFStudio_v2018_4_0_linux64.deb")
source=(${pkgname}.desktop
	${pkgname}.install
	${pkgname}.png)

prepare() {
	bsdtar xf data.tar.gz
	bsdtar xf "opt/pdfstudio2018/lib/pdfstudio.jar" resources/license.html

	rm -rf "opt/pdfstudio2018/jre"
}

package() {

	cd "${srcdir}"
			
	install -dm 755 "${pkgdir}/opt"
	install -Dm644 ${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -Dm644 ${pkgname}.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
	install -Dm644 resources/license.html "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.html"
	
	cp -r opt/ "${pkgdir}"
	mkdir -p "${pkgdir}/usr/bin"
	ln -s /opt/pdfstudio2018/pdfstudio2018 "${pkgdir}/usr/bin/pdfstudio"
}
