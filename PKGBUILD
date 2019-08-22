# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=mup
pkgver=6.7
_pkgver=67
pkgrel=1
pkgdesc="Music publisher, creates PostScript printed music or MIDI"
arch=('i686' 'x86_64')
url="http://arkkra.com"
license=('custom')
depends=('fltk' 'libxpm')
makedepends=('gendesk')
source=("ftp://ftp.arkkra.com/pub/unix/$pkgname${_pkgver}src.tar.gz" 'makefile.patch' 'gcc7.patch')
sha256sums=('254ff1b67e46714b6817555218c0256f73ab57306e14438bcb34aed9a15da34c'
            'd0e2d9d57e4131335678e65c4db94ba182e0fd55c84482acfda630cfceaf5253'
            '0fa766c5907dbe1a026df8cc45c8b8cb75c8238c538d907288d1353e51d0f62b')

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
