# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=googledot-cursor-theme
pkgver=1.1.2
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
sha256sums=('56b24e9a6141796c598e8904438f623963746dd1f15c22f405093c2b96dd5229'
            'f674660783fa0f60fff8ab558687620fc024e7f9c2f0a0ecf0f0d615fda4b87f')

prepare() {
	cd Google_Cursor-$pkgver
	mkdir -p bitmaps
	bsdtar -xf "$srcdir/$pkgname-bitmaps-$pkgver.zip" -C bitmaps
}

build() {
	cd Google_Cursor-$pkgver/builder
	_themes='Blue Black White'
	_sizes='22 24 28 32 40 48 56 64 72 80 88 96'

	set -- ${_sizes}
	for t in $_themes; do
		python build.py unix -p "../bitmaps/GoogleDot-$t" --xsizes ${_sizes[@]}
	done
}

package() {
	cd Google_Cursor-$pkgver
	install -d "$pkgdir/usr/share/icons"
	cp -r themes/GoogleDot-* "$pkgdir/usr/share/icons"
}
