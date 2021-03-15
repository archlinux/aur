# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=xcursor-pro-cursor-theme
pkgver=1.1.0
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
sha256sums=('3c2526570d158eba2b081fd1bcd8503f94515d4d2a1beb13a34a4e365841819e'
            '4130e754898d7b5a0c4873c8719411d36e8a49a5fc8635b23461ac9556a39b20')

prepare() {
  cd XCursor-pro-$pkgver
  mkdir -p bitmaps
  bsdtar -xf "$srcdir/$pkgname-bitmaps-$pkgver.zip" -C bitmaps
}

build() {
	cd XCursor-pro-$pkgver/builder
	python build.py unix -p ../bitmaps/XCursor-Pro-Dark
	python build.py unix -p ../bitmaps/XCursor-Pro-Light
}

package() {
	cd XCursor-pro-$pkgver
	install -d "$pkgdir/usr/share/icons"
	cp -r themes/XCursor-Pro* "$pkgdir/usr/share/icons"
}
