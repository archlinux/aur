# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=googledot-cursor-theme
pkgver=1.1.3
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
sha256sums=('914941edc52e5ce3cca15ab498b462255e62ac137b6b95ae948d54cf97b71d22'
            '3f3e295e6e6fba5ccc5bc2adc02807df87941abeec35fbc6289d61285ac9d8a5')

prepare() {
  cd Google_Cursor-$pkgver
  mkdir -p bitmaps
  bsdtar -xf "$srcdir/$pkgname-bitmaps-$pkgver.zip" -C bitmaps
}

build() {
  cd Google_Cursor-$pkgver
  _themes='Blue Black White'
  _sizes='22 24 28 32 40 48 56 64 72 80 88 96'

  pushd builder
  set -- ${_sizes}
  for t in $_themes; do
    python build.py unix -p "../bitmaps/GoogleDot-$t" --xsizes ${_sizes[@]}
  done
  popd
}

package() {
  cd Google_Cursor-$pkgver
  install -d "$pkgdir/usr/share/icons"
  cp -r themes/GoogleDot-* "$pkgdir/usr/share/icons"
}
