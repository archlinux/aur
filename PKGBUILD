# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=xcursor-pro-cursor-theme
pkgver=1.1.1
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
sha256sums=('d545af2c75120425b65ba0cbf6d83931c289c1d2dddd9ce178f41db7285b0415'
            'c0377c224623dc50be7428257a4cd1cc3e44dbdf4b16532f0a927bb58bc7eb50')

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
