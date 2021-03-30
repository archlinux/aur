# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=bibata-rainbow-cursor-theme
pkgver=1.1.1
pkgrel=1
pkgdesc="Material Based Cursor Theme: Rainbow"
arch=('any')
url="https://github.com/ful1e5/Bibata_Cursor_Rainbow"
license=('GPL3')
depends=('libxcursor' 'libpng')
makedepends=('python-clickgen')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "$pkgname-bitmaps-$pkgver.zip::$url/releases/download/v$pkgver/bitmaps.zip")
noextract=("$pkgname-bitmaps-$pkgver.zip")
sha256sums=('eb7cba3b7a54fe053d3888a0b90c7a2f1116be932e6bf3380a5702247b932e74'
            '70df60fdbc1bf8a7533054da8d1d353b7d7844f482900c0aa55033dd5e7b5ffe')

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
