# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Andre Klitzing <andre () incubo () de>

pkgname=nsis
pkgver=3.03
pkgrel=1
pkgdesc='A professional open source system to create Windows installers'
arch=('i686' 'x86_64')
url='http://nsis.sourceforge.net'
license=('custom:zlib')
depends=('gcc-libs')
makedepends=('scons' 'mingw-w64-gcc' 'mingw-w64-zlib')
options=(!strip)
source=(http://downloads.sourceforge.net/project/nsis/NSIS%203/$pkgver/$pkgname-$pkgver-src.tar.bz2)
sha256sums=('abae7f4488bc6de7a4dd760d5f0e7cd3aad7747d4d7cd85786697c8991695eaa')


prepare() {
  cd "$srcdir/$pkgname-$pkgver-src"
}

build() {
  cd "$srcdir/$pkgname-$pkgver-src"
  scons VERSION=$pkgver PREFIX=/usr PREFIX_CONF=/etc SKIPUTILS='NSIS Menu' STRIP_CP=false ZLIB_W32=/usr/i686-w64-mingw32/
}

package() {
  cd "$srcdir/$pkgname-$pkgver-src"
  scons VERSION=$pkgver PREFIX=/usr PREFIX_CONF=/etc SKIPUTILS='NSIS Menu' STRIP_CP=false ZLIB_W32=/usr/i686-w64-mingw32/ PREFIX_DEST="$pkgdir" install
  install -Dm644 ${srcdir}/$pkgname-$pkgver-src/Docs/src/license.but "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
