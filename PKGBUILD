# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=mup
pkgver=6.7
_pkgver=67
pkgrel=2
pkgdesc="Music publisher, creates PostScript printed music or MIDI"
arch=('i686' 'x86_64')
url="http://arkkra.com"
license=('custom')
depends=('fltk' 'libxpm')
makedepends=('gendesk')
source=("ftp://ftp.arkkra.com/pub/unix/$pkgname${_pkgver}src.tar.gz")
sha256sums=('254ff1b67e46714b6817555218c0256f73ab57306e14438bcb34aed9a15da34c')

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
