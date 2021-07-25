# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=bibata-rainbow-cursor-theme
pkgver=1.1.2
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
sha256sums=('95aa35220093fec18255465c07aba65aa4f6571761690886eb1e99dd7f8155ad'
            '14fbf46bbb69bed0f3a6b48e544995d27cfba49298a26225eff970a1cde60011')

prepare() {
  cd Bibata_Cursor_Rainbow-$pkgver
  mkdir -p bitmaps
  bsdtar -xf "$srcdir/$pkgname-bitmaps-$pkgver.zip" -C bitmaps

  rm -rf themes
}

build() {
  cd Bibata_Cursor_Rainbow-$pkgver/builder
  make build_unix
}

package() {
  cd Bibata_Cursor_Rainbow-$pkgver
  install -d "$pkgdir"/usr/share/icons
  cp -r themes/Bibata-* "$pkgdir"/usr/share/icons
}
