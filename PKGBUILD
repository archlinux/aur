# Maintainer: Robert Lowe <pngwen@acm.org>
pkgname=xpilot
pkgver=4.5.5
pkgrel=1
pkgdesc='XPilot - Multiplayer online space action since 1991'
arch=('x86_64')
url='http://xpilot.org'
license=('GPL')
makedepends=('imake' 'setconf' 'xorgproto')
source=("$pkgname-$pkgver.tar.bz2::https://downloads.sourceforge.net/project/xpilotgame/xpilot-4/xpilot-4.5.5/xpilot-$pkgver.tar.bz2")
sha256sums=('5e40424d093c8b712170a5dff3396df63302775f42da829b8832840f359cd92a')

prepare() {
  cd "$pkgname-$pkgver"
  setconf -a Local.config PREFIX=/usr
  sed -i 's/getline/xpilot_getline/g' src/client/textinterface.c
  xmkmf -a
  cd ..
}

build() {
  cd "$pkgname-$pkgver"
  make -s 
}

package() {
  cd $pkgname-$pkgver
  make -s DESTDIR="$pkgdir/" install install.man
}
