# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=xcursor-pro-cursor-theme
pkgver=1.0.0
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
sha256sums=('81685ac57c451cf591003727bc63068ad8234e2626d545605a29608dcf3a8001'
            '62b8837f47abad89121ef374b8883d5a3ef89a04f8a8edc50cb71a9df5facee0')

prepare() {
  cd XCursor-pro-$pkgver/
  mkdir -p bitmaps
  bsdtar -xf "$srcdir/$pkgname-bitmaps-$pkgver.zip" -C bitmaps
}

build() {
	cd XCursor-pro-$pkgver/builder
	python build.py unix
}

package() {
	cd XCursor-pro-$pkgver
	install -d "$pkgdir/usr/share/icons"
	cp -r themes/XCursor-Pro "$pkgdir/usr/share/icons"
}
