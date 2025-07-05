# Maintainer: Mike Pento <mjpento@verizon.net>
pkgname=axmud
_relname="Axmud"
_relpkg="Games-$_relname"
pkgver=2.0.0
pkgrel=1
pkgdesc="GTK3 Multi-User Dungeon (MUD) client"
arch=('any')
url="https://axmud.sourceforge.io/"
license=('GPL-3.0-only' 'LGPL-3.0-only')
depends=('perl')
optdepends=('sox' 'timidity++')
options=('!emptydirs')
source=("$pkgname-$pkgver.tar.gz::https://downloads.sourceforge.net/project/$pkgname/$_relname-$pkgver/$_relpkg-$pkgver.tar.gz")

sha256sums=('3a4213f1e3ee8bd762f55305a671aa9514d282e84f658890f214732719321bbb')

build() {
  cd "$srcdir/$_relpkg-$pkgver"

  perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd "$srcdir/$_relpkg-$pkgver"
  make DESTDIR=${pkgdir} install

  install -Dm644 "$srcdir/$_relpkg-$pkgver/pack/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "$srcdir/$_relpkg-$pkgver/pack/b$pkgname.desktop" "$pkgdir/usr/share/applications/b$pkgname.desktop"
  install -Dm644 "$srcdir/$_relpkg-$pkgver/pack/$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 "$srcdir/$_relpkg-$pkgver/share/icons/system/dialogue_icon_large.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 "$srcdir/$_relpkg-$pkgver/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/$_relpkg-$pkgver/COPYING.LESSER" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.LESSER"

  find ${pkgdir} -name '.packlist' -delete
  find ${pkgdir} -name 'perllocal.pod' -delete
}
# vim: ts=2 sw=2 et:
