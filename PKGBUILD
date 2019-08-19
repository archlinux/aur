# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=pdfstudioviewer
_pkgname=pdfstudioviewer2019
pkgver=2019.1.1
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
sha256sums_i686=('91aac74b5382f25d4f60decb9ff9ae76544ba67aeca1ff82d80135610fe83b94')
sha256sums_x86_64=('96140bc8a4370ca310c03994562dbae45fa39cc9964850fa8bbac1f1e119d5a4')

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
