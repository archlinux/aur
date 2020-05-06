# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=mup
pkgver=6.8
_pkgver=68
pkgrel=1
pkgdesc="Music publisher, creates PostScript printed music or MIDI"
arch=('i686' 'x86_64')
url="http://arkkra.com"
license=('custom')
depends=('fltk' 'libxpm')
makedepends=('gendesk')
source=("ftp://ftp.arkkra.com/pub/unix/$pkgname${_pkgver}src.tar.gz")
sha256sums=('3e0c6a78e18a49fd4a3c64db97c71bc9996e7073f9ff81965f916544bd2d7b19')

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
