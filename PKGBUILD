# Maintainer: 0b100100 <0b100100 at protonmail dot ch>
# Contributor: Phillip Smith <pkgbuild@phs.id.au>
# Contributor: gregor <gregor@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=dump
pkgver=0.4b47
pkgrel=1
pkgdesc="Dump/Restore ext2/3/4 filesystem backup"
arch=('i686' 'x86_64')
url="http://dump.sourceforge.net"
license=('BSD')
depends=('util-linux-libs' 'zlib' 'bzip2' 'lzo' 'readline' 'ncurses' 'e2fsprogs')
makedepends=('util-linux' 'sqlite' 'openssl')
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz")
sha512sums=('e9c567fe2ffad196b9657c551d83f7607758f3704cad6cb407514bbe2bc765c16968997dc3a5bc92b9eb5900fa5bd6e7cebc92c81afff53339fca92891a5259d')

build() {
  cd "$pkgname-$pkgver"
  ./configure \
    --prefix=/usr \
    --sbindir='${exec_prefix}/bin' \
    --sysconfdir=/etc \
    --disable-rmt \
    --disable-selinux
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -Dm644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim:set ts=2 sw=2 et:
