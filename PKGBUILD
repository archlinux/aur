# Maintainer: Manuel Reimer <manuel.reimer@gmx.de>
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Geoffroy Carrier <geoffroy.carrier@koon.fr>
# Previous Contributor: Baptiste Daroussin <baptiste.daroussin@gmail.com>

pkgname=tnftp6
pkgver=20230507
pkgrel=1
pkgdesc="NetBSD FTP client with several advanced features. Built with IPv6 support."
arch=('x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="ftp://ftp.netbsd.org/pub/NetBSD/misc/tnftp/"
license=('BSD')
depends=('glibc' 'ncurses' 'libncursesw.so' 'dante' 'openssl')
provides=('tnftp')
conflicts=('tnftp')
source=(ftp://ftp.netbsd.org/pub/NetBSD/misc/tnftp/tnftp-$pkgver.tar.gz)
sha256sums=('be0134394bd7d418a3b34892b0709eeb848557e86474e1786f0d1a887d3a6580')

build() {
  cd "$srcdir/tnftp-$pkgver"
  ./configure \
    --prefix=/usr \
    --with-socks=no \
    --enable-editcomplete \
    --enable-ssl \
    --enable-ipv6
  make
}

package() {
  cd "$srcdir/tnftp-$pkgver"
  make install DESTDIR="$pkgdir"
  install -Dm 755 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 ChangeLog INSTALL NEWS README THANKS todo -t "${pkgdir}/usr/share/doc/${pkgname}"
}
