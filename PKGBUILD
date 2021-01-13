# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Jesse Spangenberger <azulephoenix@gmail.com>
# Contributor: Tristelune <tristelune@archlinux.info>

_pkgname=PDFStudio
pkgname=${_pkgname,,}-bin
_pkgver=2020
pkgver=$_pkgver.3.1
pkgrel=1
pkgdesc='Review, annotate, and edit PDF Documents'
arch=('x86_64' 'i686')
url='https://www.qoppa.com/pdfstudio/'
license=('custom')
depends=('java-runtime>=6')
provides=("${pkgname%-bin}=$pkgver")
conflicts=("${pkgname%-bin}")
replaces=("${pkgname%-bin}")
source=("${pkgname%-bin}.desktop"
	    "${pkgname%-bin}.png")
source_x86_64=("https://download.qoppa.com/${pkgname%-bin}/v$_pkgver/${_pkgname}_v${pkgver//./_}_linux64.deb")
source_i686=("https://download.qoppa.com/${pkgname%-bin}/v$_pkgver/${_pkgname}_v${pkgver//./_}_linux.deb")
sha256sums=('8bbf7d3aaedfdde658e8fe5fc9bf30b92f1643986507b3d90e0eb6ebf1c39a0c'
            '0a3c1c337a22228f3df28412ca65d45d0d8067b508cf7b1cf93810fc17c9b447')
sha256sums_x86_64=('6d7e7d4d0061daab16b134bd29e38770d82a1180426095b346f652a1dba39256')
sha256sums_i686=('e474325cb5e87345bbaf056a1b289ffccb8c9fe5549012b45b682d40df5d8bcb')

prepare() {
	bsdtar xf data.tar.gz
	bsdtar xf "opt/${pkgname%-bin}$_pkgver/lib/pdfstudio.jar" resources/license.html
	rm -rf "opt/${pkgname%-bin}$_pkgver/jre"
}

package() {
	install -Dm644 -t "$pkgdir/usr/share/applications/" "${pkgname%-bin}.desktop"
	install -Dm644 -t "$pkgdir/usr/share/pixmaps/" "${pkgname%-bin}.png"
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" resources/license.html
	install -dm 755 "$pkgdir/usr/share/"
	cp -r "opt/${pkgname%-bin}$_pkgver" "$pkgdir/usr/share/${pkgname%-bin}"
	install -dm 755 "$pkgdir/usr/bin"
	ln -sf "/usr/share/${pkgname%-bin}/${pkgname%-bin}$_pkgver" "$pkgdir/usr/bin/${pkgname%-bin}"
}
