# Maintainer: Jesse Spangenberger <azulephoenix@gmail.com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Tristelune <tristelune@archlinux.info>

pkgname=pdfstudio-bin
pkgver=19.2.1
pkgrel=1
pkgdesc='Review, annotate, and edit PDF Documents'
arch=('x86_64' 'i686')
url='http://www.qoppa.com/pdfstudio/'
license=('custom')
depends=('java-runtime>=6')
source=("${pkgname%-bin}.desktop"
	    "${pkgname%-bin}.png")
provides=("${pkgname%-bin}")
conflicts=("${provides[@]}")
replaces=("${provides[@]}")
source_x86_64=("http://download.qoppa.com/pdfstudio/PDFStudio_linux64.deb")
source_i686=("http://download.qoppa.com/pdfstudio/PDFStudio_linux.deb")
sha256sums=('8bbf7d3aaedfdde658e8fe5fc9bf30b92f1643986507b3d90e0eb6ebf1c39a0c'
            '0a3c1c337a22228f3df28412ca65d45d0d8067b508cf7b1cf93810fc17c9b447')
sha256sums_x86_64=('73197a7caf6dcfe503ee7a4af0737b16c8cb24803b4b363d989bd2f8751c3029')
sha256sums_i686=('a8e41cf6c9d34359a790afac451ecfac3a7bb80134910f6bf81e4851ea04fda3')

prepare() {
	bsdtar xf data.tar.gz
	bsdtar xf 'opt/pdfstudio2019/lib/pdfstudio.jar' resources/license.html
	rm -rf 'opt/pdfstudio2019/jre'
}

package() {
	install -Dm644 -t "${pkgdir}/usr/share/applications/" "${pkgname%-bin}.desktop"
	install -Dm644 -t "${pkgdir}/usr/share/pixmaps/" "${pkgname%-bin}.png"
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname%-bin}/" resources/license.html
	install -dm 755 "$pkgdir/usr/share/"
	cp -r opt/pdfstudio2019 "$pkgdir/usr/share/${pkgname%-bin}"
	install -dm 755 "$pkgdir/usr/bin"
	ln -sf "/usr/share/${pkgname%-bin}/pdfstudio2019" "$pkgdir/usr/bin/${pkgname%-bin}"
}
