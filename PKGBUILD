# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=googledot-cursor-theme
pkgver=1.1.3
pkgrel=3
pkgdesc="Cursor theme inspired on Google"
arch=('any')
url="https://github.com/ful1e5/Google_Cursor"
license=('GPL3')
depends=('libxcursor' 'libpng')
makedepends=('python-clickgen1')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "$pkgname-bitmaps-$pkgver.zip::$url/releases/download/v$pkgver/bitmaps.zip")
noextract=("$pkgname-bitmaps-$pkgver.zip")
sha256sums=('914941edc52e5ce3cca15ab498b462255e62ac137b6b95ae948d54cf97b71d22'
            '3f3e295e6e6fba5ccc5bc2adc02807df87941abeec35fbc6289d61285ac9d8a5')

prepare() {
  cd Google_Cursor-$pkgver
  mkdir -p bitmaps
  bsdtar -xf "$srcdir/$pkgname-bitmaps-$pkgver.zip" -C bitmaps/
}

build() {
  cd Google_Cursor-$pkgver

  pushd builder
  _themes='Blue Black Red White'
  _sizes='22 24 28 32 40 48 56 64 72 80 88 96'

  set -- ${_sizes}
  for t in $_themes; do
    python build.py unix -p "../bitmaps/GoogleDot-$t" --xsizes ${_sizes[@]}
  done
  popd
}

package() {
  cd Google_Cursor-$pkgver
  install -d "$pkgdir/usr/share/icons"
  cp -r themes/GoogleDot-* "$pkgdir/usr/share/icons/"
}
