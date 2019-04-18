# Maintainer: Gerald Bischof gBischof at gebix dot com
pkgname=pdfmerger
pkgver=0.2.0
pkgrel=1
epoch=
pkgdesc="A simple Qt frontend for poppler's pdfunite"
arch=(x86_64)
url=""
license=('GPL3')
groups=()
depends=(poppler qt5-base)
makedepends=(qt5-tools)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname::git+https://gitlab.com/gBischof/pdfmerger.git")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

prepare() {
	cd "$pkgname"
	git checkout v$pkgver
}

build() {
	cd "$pkgname"
	qmake
	make
	lrelease resources/translations/PdfMerger_de.ts
	make clean
}

check() {
	cd "$pkgname"
	make -k check
}

package() {
	cd "$pkgname"
	#make DESTDIR="$pkgdir/" install
	mkdir -p $pkgdir/usr/bin
	mkdir -p $pkgdir/usr/share/applications
	mkdir -p $pkgdir/usr/share/PdfMerger/translations
	mkdir -p $pkgdir/usr/share/PdfMerger/icons
	install pdfmerger $pkgdir/usr/bin/
	install resources/desktop/pdfmerger.desktop $pkgdir/usr/share/applications
	install resources/translations/PdfMerger_de.qm $pkgdir/usr/share/PdfMerger/translations
	install resources/icons/pdfmerger.svg $pkgdir/usr/share/PdfMerger/icons
	install resources/icons/pdfmerger.png $pkgdir/usr/share/PdfMerger/icons
}
