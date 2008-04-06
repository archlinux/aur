# $Id: PKGBUILD,v 1.18 2007/11/16 00:02:36 daniel Exp $
# Maintainer: Judd Vinet <jvinet@zeroflux.org>

pkgname=openvpn
pkgver=2.0.9
pkgrel=3
pkgdesc="An easy-to-use, robust, and highly configurable VPN (Virtual Private Network)"
arch=(i686 x86_64)
url="http://openvpn.sourceforge.net/"
depends=('openssl' 'lzo2')
license=('custom')
backup=(usr/share/openvpn/easy-rsa/vars usr/share/openvpn/easy-rsa/openssl.cnf)
source=(http://openvpn.net/release/openvpn-$pkgver.tar.gz)
md5sums=('60745008b90b7dbe25fe8337c550fec6')
install=openvpn.install

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
  mkdir -p $startdir/pkg/etc/openvpn
  cp -a sample-config-files $startdir/pkg/etc/openvpn/examples
  chmod 755 $startdir/pkg/etc/openvpn/examples
  install -D -m644 COPYING $startdir/pkg/usr/share/licenses/$pkgname/COPYING

  # Install easy-rsa
  make -C easy-rsa/2.0 install DESTDIR=$startdir/pkg PREFIX=usr/share/openvpn/easy-rsa
}
