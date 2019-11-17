# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=pdfstudioviewer
_pkgname=pdfstudioviewer2019
pkgver=2019.2.0
pkgrel=1
pkgdesc="Review, annotate, and edit PDF Documents"
arch=('i686' 'x86_64')
url="https://www.qoppa.com/pdfstudioviewer"
license=('custom')
depends=('java-runtime=8' 'desktop-file-utils' 'sane')
source_i686=("${pkgname}-${pkgver}_linux.deb::https://download.qoppa.com/$pkgname/PDFStudioViewer_linux.deb")
source_x86_64=("${pkgname}-${pkgver}_linux64.deb::https://download.qoppa.com/$pkgname/PDFStudioViewer_linux64.deb")
source=("$pkgname.desktop")
sha256sums=('d6fb9b6f18a80bc44b8e2079683bfd1903153887861630e0c9c3813c6f3119d2')
sha256sums_i686=('e6399666d53106ba0acab0a618c79ad8d34c840a2baa9a6d341f1c1ad7c0ccf9')
sha256sums_x86_64=('d82e5db92ecf8c8b0b74d460eb4a354bf46953e4e66c39f8a64bd9d2c7020d19')

prepare() {
	bsdtar xf data.tar.gz
	bsdtar xf "opt/$_pkgname/lib/pdfstudio.jar" resources/license.html

	rm -rf "opt/$_pkgname/jre"
	rm "opt/$_pkgname/updater"
}

package() {
	install -dm755 "$pkgdir/opt/$pkgname"
	cp -r "opt/$_pkgname/." "$pkgdir/opt/$pkgname/"
	install -Dm644 "$pkgname.desktop" -t "$pkgdir/usr/share/applications"
	install -Dm644 "opt/$_pkgname/.install4j/$_pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
	install -Dm644 resources/license.html -t "$pkgdir/usr/share/licenses/$pkgname"
	install -d "$pkgdir/usr/bin"
	ln -sf "/opt/$pkgname/$_pkgname" "$pkgdir/usr/bin/$pkgname"
}
