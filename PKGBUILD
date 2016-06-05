# Maintainer: Jesse Spangenberger <azulephoenix@gmail.com>
# Contributor Tristelune <tristelune@archlinux.info>
pkgname=pdfstudio9
pkgver=9.2.2
_pkgver=v9_2_2
pkgrel=1
pkgdesc="Review, annotate, and edit PDF Documents"
arch=('i686' 'x86_64')
url="http://www.qoppa.com/pdfstudio/"
license=('custom')
conflicts=('pdfstudio8' 'pdfstudio' 'pdfstudio10')
provides=('pdfstudio')
makedepends=('pacman>=4.2.0')
depends=('java-runtime>=6' 'desktop-file-utils')
depends_x86_64=('gcc-libs-multilib')

install=${pkgname}.install     
     
sha256sums=('7d4c4bee272f0f3adba5586dca0c889553358f8cda6b23a6878078fc7ce36c1a'
            'b82acfb50e1e15a43c54aba7a0712b6c710c10ae74280a26a451343720e965e3'
            '0a3c1c337a22228f3df28412ca65d45d0d8067b508cf7b1cf93810fc17c9b447')
sha256sums_i686=('5ab1854af850d5fa329cb1326f2d534e805f1d637ca725b816912b3263455494')
sha256sums_x86_64=('90774bd659259d028d1d0f630a8149b93c379643e60d9d802de4614b47afa6a8')
source_i686=("http://www.qoppa.com/files/pdfstudio/demo/downloads/version9/PDFStudio_${_pkgver}_linux.deb")
source_x86_64=("http://www.qoppa.com/files/pdfstudio/demo/downloads/version9/PDFStudio_${_pkgver}_linux64.deb")
source=(${pkgname}.desktop
		${pkgname}.install
		${pkgname}.png)

prepare() {
	bsdtar xf data.tar.gz
	bsdtar xf "opt/pdfstudio9/lib/pdfstudio.jar" resources/license.html

	rm -rf "opt/pdfstudio9/jre"
}

package() {

	cd "${srcdir}"
	
	install -dm 755 "${pkgdir}/opt"
	install -Dm644 ${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -Dm644 ${pkgname}.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
	install -Dm644 resources/license.html "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.html"
	
	cp -r opt/ "${pkgdir}"
	mkdir -p "${pkgdir}/usr/bin"
    ln -s /opt/pdfstudio9/pdfstudio9 "${pkgdir}/usr/bin/pdfstudio"
}
