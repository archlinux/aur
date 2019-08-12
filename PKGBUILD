# Maintainer: Simon Perry <aur [at] sanxion [dot] net>
pkgname=axmud
_relname="Axmud"
_relpkg="Games-$_relname"
pkgver=1.2.041
pkgrel=1
pkgdesc="GTK3 Multi-User Dungeon (MUD) client"
arch=('any')
url="https://axmud.sourceforge.io/"
license=('GPL3' 'LGPL3')
depends=('perl-archive-extract' 'perl-archive-zip' 'perl-file-copy-recursive' 'perl-file-homedir' 'perl-file-sharedir' 'perl-file-sharedir-install' 'perl-goocanvas2' 'perl-gtk3' 'perl-io-socket-inet6' 'perl-io-socket-ssl' 'perl-ipc-run' 'perl-json' 'perl-net-openssh' 'perl-path-tiny' 'perl-regexp-ipv6' 'perl-x11-wmctrl')
optdepends=('sox' 'timidity++')
options=('!emptydirs')
source=("$pkgname-$pkgver.tar.gz::https://downloads.sourceforge.net/project/$pkgname/$_relname-$pkgver/$_relpkg-$pkgver.tar.gz")

sha256sums=('ab6216e608f308fd0cb07e5864e9856006ba01a53df2c8997736ca72790c24b0')

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
