# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=xcursor-pro-cursor-theme
pkgver=1.1.2
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
sha256sums=('09405c4f861f30510978ffcacc9bf4a23af8d073b171dce5af7fd5bfc4d6db01'
            'f610b132323cc1458180a9aa67da90c13c2a3c8460499609ba09ccc538931eca')

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
