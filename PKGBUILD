# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Jesse Spangenberger <azulephoenix@gmail.com>
# Contributor: Tristelune <tristelune@archlinux.info>

_pkgname=PDFStudio
pkgname=${_pkgname,,}-bin
_pkgver=2020
pkgver=$_pkgver.3.0
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
sha256sums_x86_64=('5d579cf2ab7a7db78f0b56d1950371b1a7ecb2e0bc48fdee6d1079a6a330d60f')
sha256sums_i686=('256106dac684b6aecbbe672d9b3fb977eb695d524bf60d9d1eb07d6e42d6aecf')

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
