# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=pdfstudioviewer
_pkgname=pdfstudioviewer2019
pkgver=2019.1.3
pkgrel=1
pkgdesc="Review, annotate, and edit PDF Documents"
arch=('i686' 'x86_64')
url="https://www.qoppa.com/pdfstudioviewer"
license=('custom')
depends=('java-runtime<=8' 'desktop-file-utils' 'sane')
source_i686=("${pkgname}-${pkgver}_linux.deb::https://download.qoppa.com/$pkgname/PDFStudioViewer_linux.deb")
source_x86_64=("${pkgname}-${pkgver}_linux64.deb::https://download.qoppa.com/$pkgname/PDFStudioViewer_linux64.deb")
source=("$pkgname.desktop")
sha256sums=('366e4cc2c4db9bbb3baa0901b2a22a4e8ee0b2093d6e13e7c9558e6e28555f86')
sha256sums_i686=('58eb33cbbe14ed4f0a47372b4c5239017e8a8cdff00b4c68350f2bda7f38d7c5')
sha256sums_x86_64=('f8e72df2df81071ab0d55491f5b65a83aebdf4f5a5984ec8c1083f012ae0d0ef')

prepare() {
	bsdtar xf data.tar.gz
	bsdtar xf "opt/$_pkgname/lib/pdfstudio.jar" resources/license.html

	rm -rf "opt/$_pkgname/jre"
	rm "opt/$_pkgname/updater"
}

package() {
	install -dm 755 "$pkgdir/opt/$pkgname"
	cp -r "opt/$_pkgname/." "$pkgdir/opt/$pkgname/"
	install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -Dm644 "opt/$_pkgname/.install4j/$_pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
	install -Dm644 resources/license.html "$pkgdir/usr/share/licenses/$pkgname/LICENSE.html"
	install -d "$pkgdir/usr/bin"
	ln -s "/opt/$pkgname/$_pkgname" "$pkgdir/usr/bin/$pkgname"
}
