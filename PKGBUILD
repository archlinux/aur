# Maintainer: Jose Riha <jose1711 at gmail dot com>
# Contributor: zigmat
 
pkgname=gadmin-openvpn-server
pkgver=0.1.6
pkgrel=1
pkgdesc='A GTK+ graphical user interface for OpenVPN (server)'
arch=('i686' 'x86_64')
license=('GPL3')
depends=('openvpn' 'bridge-utils' 'gksu')
makedepends=('pkgconfig')
options=(!libtool)
url='http://dalalven.dtdns.net/linux/'
source=(http://dalalven.dtdns.net/linux/gadmin-openvpn/server/$pkgname-$pkgver.tar.gz gadmin-openvpn-server.desktop)
md5sums=('a42b18d6b58d319bb00c043ffa8347a5'
         'ff53aac86b1dc11486ba119f91366a01')
build() {
        cd $srcdir/$pkgname-$pkgver
        # some "patching" needed
        find . -type f -exec sed -i 's%/etc/init.d%/etc/rc.d%g;s%/usr/lib/openvpn/plugin/lib/openvpn-auth-pam.so%/usr/lib/openvpn/openvpn-auth-pam.so%g' '{}' \;
        ./configure --prefix=/usr
        make
}
 
package() {
        cd $srcdir/$pkgname-$pkgver
        make DESTDIR=$pkgdir install
        install -m644 -D $srcdir/gadmin-openvpn-server.desktop $pkgdir/usr/share/applications/gadmin-openvpn-server.desktop
}
