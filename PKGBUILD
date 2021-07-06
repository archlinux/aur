# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=xcursor-pro-cursor-theme
pkgver=1.1.3
pkgrel=1
pkgdesc="Modern X11 Cursor Theme"
arch=('any')
url="https://www.pling.com/p/1481466"
license=('GPL3')
depends=('libxcursor' 'libpng')
makedepends=('python-clickgen')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ful1e5/XCursor-pro/archive/v$pkgver.tar.gz"
        "$pkgname-bitmaps-$pkgver.zip::https://github.com/ful1e5/XCursor-pro/releases/download/v$pkgver/bitmaps.zip")
noextract=("$pkgname-bitmaps-$pkgver.zip")
sha256sums=('79d1cb6f2b10354db8b43c2f8978a3e048fe5f1ddd732c7fc690bba6e4b25c1a'
            '8e90eb7878e0a82d6c2747fa5a31536b6256b7b13bfb38c70d805b2a976b5d1a')

prepare() {
  cd XCursor-pro-$pkgver
  mkdir -p bitmaps
  bsdtar -xf "$srcdir/$pkgname-bitmaps-$pkgver.zip" -C bitmaps
}

build() {
	cd XCursor-pro-$pkgver/builder
	_themes='Dark Light'
	_sizes='22 24 28 32 40 48 56 64 72 80 88 96'

	set -- ${_sizes}
	for t in ${_themes}; do
		python build.py unix -p "../bitmaps/XCursor-Pro-$t" --xsizes ${_sizes[@]}
	done
}

package() {
	cd XCursor-pro-$pkgver
	install -d "$pkgdir/usr/share/icons"
	cp -r themes/XCursor-Pro* "$pkgdir/usr/share/icons"
}
