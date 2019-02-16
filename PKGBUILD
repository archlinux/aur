# Maintainer: Jesse Spangenberger <azulephoenix@gmail.com>
# Contributor: Tristelune <tristelune@archlinux.info>
pkgname=pdfstudio
pkgver=18.3.0
pkgrel=2
pkgdesc="Review, annotate, and edit PDF Documents"
arch=('i686' 'x86_64')
url="http://www.qoppa.com/pdfstudio/"
license=('custom')
conflicts=('pdfstudio12' 'pdfstudio11' 'pdfstudio8' 'pdfstudio9' 'pdfstudio10')
provides=('pdfstudio')
makedepends=('pacman>=4.2.0')
depends=('java-runtime>=6' 'gtk-update-icon-cache')

install=${pkgname}.install     
     
sha256sums=('b6b561761157363b835f7e09e8c860fa65b964dc00e3b58836f95f0f6cce9972'
            'b82acfb50e1e15a43c54aba7a0712b6c710c10ae74280a26a451343720e965e3'
            '0a3c1c337a22228f3df28412ca65d45d0d8067b508cf7b1cf93810fc17c9b447')
sha256sums_i686=('9c80228fa928a1028d110f9435f3d1d69b7540bf7e35dbd0c829aa7c4423d857')
sha256sums_x86_64=('ad54e71c40c1748fae20f1b8bead03a340a77aa1c8eba1a7a1389cdbea681520')
source_i686=("http://download.qoppa.com/pdfstudio/PDFStudio_linux.deb")
source_x86_64=("http://download.qoppa.com/pdfstudio/PDFStudio_linux64.deb")
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
