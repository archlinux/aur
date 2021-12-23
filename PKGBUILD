# Maintainer: Mike Pento <mjpento@verizon.net>
pkgname=axmud
_relname="Axmud"
_relpkg="Games-$_relname"
pkgver=1.3.019
pkgrel=1
pkgdesc="GTK3 Multi-User Dungeon (MUD) client"
arch=('any')
url="https://axmud.sourceforge.io/"
license=('GPL3' 'LGPL3')
depends=('perl-archive-extract' 'perl-archive-zip' 'perl-file-copy-recursive' 'perl-file-homedir' 'perl-file-sharedir' 'perl-file-sharedir-install' 'perl-goocanvas2' 'perl-gtk3' 'perl-math-round' 'perl-io-socket-inet6' 'perl-io-socket-ssl' 'perl-ipc-run' 'perl-json' 'perl-net-openssh' 'perl-path-tiny' 'perl-regexp-ipv6' 'perl-x11-wmctrl')
optdepends=('sox' 'timidity++')
options=('!emptydirs')
source=("$pkgname-$pkgver.tar.gz::https://downloads.sourceforge.net/project/$pkgname/$_relname-$pkgver/$_relpkg-$pkgver.tar.gz")

sha256sums=('0919325465652ed001c9b3427e5f6ed75d7f7996495658fa2616c7285e3a0c82')

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
