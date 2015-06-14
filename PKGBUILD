# Maintainer: Jesse Spangenberger <azulephoenix@gmail.com>
pkgname=pdfstudio8
pkgver=8.4.0
_pkgver=v8_4_0
pkgrel=8
pkgdesc="Review, annotate, and edit PDF Documents"
arch=('x86_64' 'i686')
url="http://www.qoppa.com/pdfstudio/"
license=('custom')
conflicts=('pdfstudio')
provides=('pdfstudio8')
makedepends=('pacman>=4.2.0')
depends=('java-runtime' 'desktop-file-utils')
depends_x86_64=('gcc-libs-multilib')
install="$pkgname.install"
     
sha256sums=('4f89c96112338526e47cd859f81c066d676c8875c373489996435d1227c25341'
            'f703f8de14eb277dc72cc837086fbd55f5d772049a44200686c8ae76348f6614'
            '0a3c1c337a22228f3df28412ca65d45d0d8067b508cf7b1cf93810fc17c9b447')
sha256sums_x86_64=('67e6828769924f9afb42d4b94257255c17695a7e5fe597c2e7d61c1d67d5ccfc')
sha256sums_i686=('ee552d0de16a105ff544d023ac4a86577ada4d45e46cde0fa6b89043ddd7b7ed')

source_i686=("http://www.qoppa.com/files/pdfstudio/demo/updates/version8/PDFStudio_${_pkgver}_linux.deb")
source_x86_64=("http://www.qoppa.com/files/pdfstudio/demo/updates/version8/PDFStudio_${_pkgver}_linux64.deb")
source=(${pkgname}.desktop
		${pkgname}.install
		${pkgname}.png)

package() {
    cd "$srcdir"
    
    bsdtar -xf data.tar.gz
    bsdtar -xf "${srcdir}/opt/pdfstudio8/lib/pdfstudio.jar" resources/license.html
    
    rm -r "${srcdir}/opt/pdfstudio8/jre"
        
	install -dm 755 "${pkgdir}/opt"
	install -Dm644 ${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -Dm644 ${pkgname}.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
	install -Dm644 resources/license.html "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.html"
    
	cp -r opt/ "${pkgdir}"
	mkdir -p "${pkgdir}/usr/bin"
    ln -s /opt/pdfstudio8/pdfstudio8 "${pkgdir}/usr/bin/pdfstudio"
 }
 
