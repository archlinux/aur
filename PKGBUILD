# Maintainer: X0rg

_realname=FrozenWay
pkgname=frozenway
pkgver=1.6.5
pkgrel=6
pkgdesc="A project that gives those involved the ability to pass through any firewall or proxy"
arch=('i686' 'x86_64')
url="http://www.frozendo.com/frozenway"
license=('custom')
depends=('openssl' 'lzo' 'qt4' 'net-tools')
backup=(opt/$pkgname/etc/auth.key
	opt/$pkgname/etc/frozenway.crt)
source=('frozenway.desktop'
	'frozenway.png')
source_i686=("$pkgname-$pkgver-i686.tar.gz::http://www.frozendo.com/frozenway/download/linux-i386/$pkgver")
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::http://www.frozendo.com/frozenway/download/linux-x86_64/$pkgver")
md5sums=('2f5fafd15a76516f2b7335f9a104f7be'
         '739255c8a65943dfc4059d809697c3ac')
md5sums_i686=('465f3d26dac16f9f416359d924ae8fb3')
md5sums_x86_64=('85d117de94ca702287f6b1cb48c6cc3d')

prepare() {
	mv -v "$srcdir/$_realname $pkgver" "$srcdir/$pkgname-$pkgver"
}

package() {
	# Put stuff in /opt/frozenway/bin and /opt/frozenway/etc
	msg2 "Install files in /opt/$pkgname/..."
	install -d "$pkgdir/opt/$pkgname/"{bin,etc}
	install -vm755 "$srcdir/$pkgname-$pkgver/bin/"{FrozenWay,FrozenWayAskPass,FrozenWayHelper,openvpn} "$pkgdir/opt/$pkgname/bin/"
	install -vm644 "$srcdir/$pkgname-$pkgver/etc/"* "$pkgdir/opt/$pkgname/etc/"

	# Install license
	msg2 "Install custom license..."
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	install -vm644 "$srcdir/$pkgname-$pkgver/bin/license.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	# Install executable
	msg2 "Create a link for executable in /usr/bin/..."
	install -d "$pkgdir/usr/bin/"
	ln -srv "$pkgdir/opt/$pkgname/bin/FrozenWay" "$pkgdir/usr/bin/$pkgname"

	# Install desktop file
	msg2 "Install desktop file provided by package..."
	install -d "$pkgdir/usr/share/"{pixmaps,applications}
	install -vm644 "$srcdir/frozenway.png" "$pkgdir/usr/share/pixmaps/frozenway.png"
	install -vm644 "$srcdir/frozenway.desktop" "$pkgdir/usr/share/applications/frozenway.desktop"
}
