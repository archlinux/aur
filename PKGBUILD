# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=googledot-cursor-theme
pkgver=1.1.1
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
sha256sums=('5e67f2293b098ab6ae0c5cb7a6f740ed834f263e60cefa0b637ab1c43113f69e'
            'b414be817b365922f6fc3cf1a95aa8cdf5cd1ca053b40dfe2c8bda6ce308f889')

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
