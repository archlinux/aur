pkgname=tinc-pre
pkgver=1.1pre11
pkgrel=2
pkgdesc="VPN (Virtual Private Network) daemon (Pre-release)"
arch=(i686 x86_64)
url="http://www.tinc-vpn.org/"
license=('GPL')
depends=('lzo2' 'zlib' 'openssl')
optdepends=('wxpython: gui support')
provides=('tinc-pre')
conflicts=('tinc')
source=(http://www.tinc-vpn.org/packages/tinc-$pkgver.tar.gz)
md5sums=('e9cc2971927d31e703f0c2b1791a4edf')

package() {
cd "$startdir/src/tinc-$pkgver"

./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var 
--sbindir=/usr/bin
make
make DESTDIR="$pkgdir" install

mkdir -p $pkgdir/etc/tinc/
tar xzvf doc/sample-config.tar.gz -C $pkgdir/etc/tinc/

sed 's,#!/usr/bin/python,#!/usr/bin/python2,' $pkgdir/usr/bin/tinc-gui > 
$pkgdir/usr/bin/tinc-gui2
mv $pkgdir/usr/bin/tinc-gui2 $pkgdir/usr/bin/tinc-gui
chmod +x $pkgdir/usr/bin/tinc-gui
}

