# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=googledot-cursor-theme
pkgver=1.1.0
pkgrel=1
pkgdesc="Cursor theme inspired on Google"
arch=('any')
url="https://www.pling.com/p/1215613"
license=('GPL3')
depends=('libxcursor' 'libpng')
makedepends=('python-clickgen')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ful1e5/Google_Cursor/archive/v$pkgver.tar.gz"
        "$pkgname-bitmaps-$pkgver.zip::https://github.com/ful1e5/Google_Cursor/releases/download/v$pkgver/bitmaps.zip")
noextract=("$pkgname-bitmaps-$pkgver.zip")
sha256sums=('c0082299be26a1f157c5beb71f1957c978747a044347ce44fcbd28ade5751ea5'
            'fa16d5db8ba80df7c1f8b4d59647785fbfc8818717fdca05f051d75d458a9da1')

prepare() {
	cd Google_Cursor-$pkgver
	mkdir -p bitmaps
	bsdtar -xf "$srcdir/$pkgname-bitmaps-$pkgver.zip" -C bitmaps
}

build() {
	cd Google_Cursor-$pkgver/builder
	_themes='Blue Black'

	for t in $_themes; do
		python build.py unix -p "../bitmaps/GoogleDot-$t"
	done
}

package() {
	cd Google_Cursor-$pkgver
	install -d "$pkgdir/usr/share/icons"
	cp -r themes/GoogleDot-* "$pkgdir/usr/share/icons"
}
