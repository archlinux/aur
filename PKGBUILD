# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=bibata-rainbow-cursor-theme
pkgver=1.1.0
pkgrel=3
pkgdesc="Material Based Cursor Theme: Rainbow"
arch=('any')
url="https://github.com/ful1e5/Bibata_Cursor_Rainbow"
license=('GPL3')
depends=('libxcursor' 'libpng')
makedepends=('python-clickgen')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "$pkgname-bitmaps-$pkgver.zip::$url/releases/download/v$pkgver/bitmaps.zip")
noextract=("$pkgname-bitmaps-$pkgver.zip")
sha256sums=('b6b1818c0df0d9d983fd6d1fad52618439a18e709e4ced88f3479672ff8a7f27'
            'a6e38ad1036b31aa01122e5926ba2fd0b8bda591b3c0b0adacd91f0f0819df92')

prepare() {
	cd Bibata_Cursor_Rainbow-$pkgver
	mkdir -p bitmaps
	bsdtar -xf "$srcdir/$pkgname-bitmaps-$pkgver.zip" -C bitmaps

	rm -rf themes
}

build() {
	cd Bibata_Cursor_Rainbow-$pkgver/builder
	_themes='Modern Original'
	_sizes='22 24 28 32 40 48 56 64 72 80 88 96'

	set -- ${_sizes}
	for t in ${_themes}; do
		python build.py unix -p "../bitmaps/Bibata-Rainbow-$t" --xsizes ${_sizes[@]}
	done
}

package() {
	cd Bibata_Cursor_Rainbow-$pkgver
	install -d "$pkgdir"/usr/share/icons
	cp -r themes/Bibata-* "$pkgdir"/usr/share/icons
}
