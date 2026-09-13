# Maintainer: 0b100100 <0b100100 at protonmail dot ch>
# Contributor: Phillip Smith <pkgbuild@phs.id.au>
# Contributor: gregor <gregor@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=dump
pkgver=0.4b56
pkgrel=1
pkgdesc="Dump/Restore ext2/3/4 filesystem backup"
arch=('i686' 'x86_64')
url="http://dump.sourceforge.net"
license=('BSD')
depends=('util-linux-libs' 'zlib' 'bzip2' 'lzo' 'readline' 'ncurses' 'e2fsprogs')
makedepends=('util-linux' 'sqlite' 'openssl')
conflicts=('tar-scripts')
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('049a7a5b3650ac685c763c5237ae4ad4b640d4e1e2dff95dc487a7988e8d96ac')

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
  # No longer conflicts with tar, as its /usr/bin/restore was split off into 'tar-scripts'
  #mv -v "$pkgdir"/usr/bin/restore{,.dump}
  #mv -v "$pkgdir"/usr/share/man/man8/restore{,.dump}.8
  #ln -vnsf restore.dump "$pkgdir"/usr/bin/rrestore
}

# vim:set ts=2 sw=2 et:
