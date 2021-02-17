# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=googledot-cursor-theme
pkgver=1.0.1
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
sha256sums=('5eaaa21cb96e9c310d78dbb577e4c1109f6aa5e96c0dc054abb6c7b097a4a2cf'
            '61c0bff15a77cacf5367c5172bfe5014af258cfa9fbfa5df5c65f8d3aea095c5')

prepare() {
  cd Google_Cursor-$pkgver
  mkdir -p bitmaps
  bsdtar -xf "$srcdir/$pkgname-bitmaps-$pkgver.zip" -C bitmaps
}

build() {
	cd Google_Cursor-$pkgver/builder
	python build.py unix
}

package() {
	cd Google_Cursor-$pkgver
	install -d "$pkgdir/usr/share/icons"
	cp -r themes/GoogleDot "$pkgdir/usr/share/icons"
}
