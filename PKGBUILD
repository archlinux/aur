# Maintainer: ObserverOfTime <chronobserver@disroot.org>
# Based on ttfautohint

_basename=ttfautohint
pkgname=ttfautohint-cli
pkgver=1.8.4
pkgrel=1
pkgdesc="Provides automated hinting process for web fonts (CLI only)"
arch=(x86_64)
url="https://www.freetype.org/ttfautohint/"
license=(FTL GPL-2.0-only)
depends=(freetype2 gcc-libs glibc harfbuzz)
conflicts=("$_basename")
provides=("$_basename=$pkgver")
source=("https://download.savannah.gnu.org/releases/freetype/$_basename-$pkgver.tar.gz")
sha256sums=('8a876117fa6ebfd2ffe1b3682a9a98c802c0f47189f57d3db4b99774206832e1')

build() {
  cd "$_basename-$pkgver"
  ./configure \
    --prefix=/usr \
    --disable-static \
    --without-qt \
    --without-doc
  make
}

check() {
  cd "$_basename-$pkgver"
  make -k check
}

package() {
  cd "$_basename-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" COPYING FTL.TXT
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" "doc/$_basename.pdf"
  install -Dm644 -t "$pkgdir/usr/share/man/man1/" "frontend/$_basename".1
}
