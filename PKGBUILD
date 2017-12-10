# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
pkgname=teeuniverse
pkgver=0.2.5
pkgrel=1
pkgdesc="Enhanced map editor for DDNet, Teeworlds, and similar games"
arch=('x86_64')
url="https://teeuniverse.net/"
license=('AGPL' 'CC-BY-SA' 'custom')
depends=('harfbuzz-icu' 'sdl2' 'glu' 'desktop-file-utils')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/teeuniverse/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('b4f94041e057ba9469746547fe9722cc')

prepare() {
  mkdir build || true
  cd build
}

build() {
  cd build
  
  cmake ../$pkgname-$pkgver       \
    -DCMAKE_BUILD_TYPE='Release'  \
    -DCMAKE_INSTALL_PREFIX='/usr'
  
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir/" install
  
    # keep all licenses in /usr/share/licenses
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname/"
  install -m644 ../$pkgname-$pkgver/LICENSE "$pkgdir/usr/share/licenses/$pkgname/"
  install -m644 ../$pkgname-$pkgver/LICENSE_DDNET "$pkgdir/usr/share/licenses/$pkgname/"
  install -m644 ../$pkgname-$pkgver/LICENSE_TEEWORLDS "$pkgdir/usr/share/licenses/$pkgname/"
  mv "$pkgdir/usr/share/$pkgname/fonts/LICENSE_DEJAVU" \
     "$pkgdir/usr/share/licenses/$pkgname/"
  mv "$pkgdir/usr/share/$pkgname/fonts/LICENSE_OFL.txt" \
     "$pkgdir/usr/share/licenses/$pkgname/"
  mv "$pkgdir/usr/share/$pkgname/languages/LICENSE" \
     "$pkgdir/usr/share/licenses/$pkgname/LICENSE_LANGUAGE"
}
