# Maintainer: Andrew Lin <andrewlin16@gmail.com>

pkgname=vgmplay
pkgver=0.40.9
pkgrel=2
pkgdesc="The offical and always up-to-date player for all VGM files"
arch=('i686' 'x86_64')
url="http://vgmrips.net/forum/viewtopic.php?t=112"
license=('GPL' 'custom')
source=("https://github.com/vgmrips/vgmplay/archive/$pkgver.tar.gz"
        "fix-vgmend-extern.patch")
depends=('libao' 'zlib')
md5sums=('a2217e465c5e3bdebc47dbb15a6cb436'
         '6fb9555d745d989f7e4578d7ee9962d3')

prepare() {
  cd "$pkgname-$pkgver"
  patch --forward --strip=2 --input="${srcdir}/fix-vgmend-extern.patch"
}

build() {
  cd "$pkgname-$pkgver/VGMPlay"
  make
}

package() {
  cd "$pkgname-$pkgver/VGMPlay"
  mkdir -m 755 -p "$pkgdir/usr/bin" "$pkgdir/usr/share/man/man1"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  make PREFIX=/usr DESTDIR="$pkgdir" play_install
  mkdir -m 755 -p "$pkgdir/usr/share/licenses/vgmplay"
  cp licenses/* "$pkgdir/usr/share/licenses/vgmplay"
}

# vim:set ts=2 sw=2 et:
