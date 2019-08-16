# Maintainer: Manuel Reimer <manuel.reimer@gmx.de>
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Geoffroy Carrier <geoffroy.carrier@koon.fr>
# Previous Contributor: Baptiste Daroussin <baptiste.daroussin@gmail.com>

pkgname=tnftp6
pkgver=20151004
pkgrel=1
pkgdesc="NetBSD FTP client with several advanced features. Built with IPv6 support."
arch=('x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="ftp://ftp.netbsd.org/pub/NetBSD/misc/tnftp/"
license=('BSD')
depends=('ncurses' 'openssl')
provides=('tnftp')
conflicts=('tnftp')
source=(ftp://ftp.netbsd.org/pub/NetBSD/misc/tnftp/tnftp-$pkgver.tar.gz)
md5sums=('a49fbe752318d5a7893f900046ea00d5')

build() {
  cd "$srcdir/tnftp-$pkgver"
  ./configure --prefix=/usr --enable-editcomplete --enable-ssl --with-socks=no
  make
}

package() {
  cd "$srcdir/tnftp-$pkgver"
  make install DESTDIR="$pkgdir"
  install -Dm755 COPYING "$pkgdir"/usr/share/licenses/${pkgname}/COPYING
}
