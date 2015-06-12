# $Id: PKGBUILD 198476 2013-10-30 15:05:50Z allan $
# Contributor: Sergej Pupykin
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=vde2-static
pkgver=2.3.2
pkgrel=5
pkgdesc="Virtual Distributed Ethernet for emulators like qemu"
url="http://sourceforge.net/projects/vde/"
license=("GPL" "LGPL" "CUSTOM")
arch=('i686' 'x86_64')
depends=('bash' 'libpcap' 'openssl')
makedepends=('python')
options=(!makeflags 'staticlibs' '!emptydirs')
source=(http://downloads.sourceforge.net/vde/vde2-$pkgver.tar.bz2)
md5sums=('46fbc5f97f03dc517aa3b2c9d9ea6628')

build() {
  cd $srcdir/vde2-$pkgver
  ./configure --prefix=/usr --sbindir=/usr/bin --sysconfdir=/etc --libexecdir=/usr/lib/vde2 \
             --enable-experimental
  make
}

package() {
  cd $srcdir/vde2-$pkgver
  make prefix=$pkgdir/usr sysconfdir=$pkgdir/etc sbindir=$pkgdir/usr/bin libexecdir=$pkgdir/usr/lib/vde2 install
  install -D -m 644 COPYING.slirpvde $pkgdir/usr/share/licenses/$pkgname/COPYING.slirpvde
  find $pkgdir -type f -or -type l | grep -vE '.a$' | while read a; do rm -f $a; done
}
