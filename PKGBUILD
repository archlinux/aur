# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=mup
pkgver=7.0
_pkgver=${pkgver//.}
pkgrel=1
pkgdesc="Music publisher, creates PostScript printed music or MIDI"
arch=('i686' 'x86_64')
url="http://arkkra.com"
license=('custom')
depends=('fltk' 'libxpm')
makedepends=('gendesk')
source=("http://www.arkkra.com/ftp/pub/unix/${pkgname}${_pkgver}src.tar.gz")
sha256sums=('9903e7c1863fa88b904ccd41a6d5aa466a0d934ba6640e6a15908f7a062a0351')

prepare() {
  cd $pkgname-$pkgver
  gendesk -f -n --pkgname=mupmate --pkgdesc="Music publisher"
}

build() {
  cd $pkgname-$pkgver
  make -f simple.makefile
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" -f simple.makefile install
  install -Dm644 mupmate.desktop "$pkgdir"/usr/share/applications/mupmate.desktop
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
