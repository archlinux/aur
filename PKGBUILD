# Maintainer: X0rg

_realname=FrozenWay
pkgname=frozenway
pkgver=1.6.7
pkgrel=1
pkgdesc="A project that gives those involved the ability to pass through any firewall or proxy"
arch=('x86_64')
url="http://www.frozendo.com/frozenway"
license=('custom')
depends=('openssl' 'lzo' 'qt4' 'net-tools')
backup=(opt/$pkgname/etc/auth.key
	opt/$pkgname/etc/frozenway.crt)
source=('frozenway.desktop'
	'frozenway.png'
	"$pkgname-$pkgver-x86_64.tar.gz::http://www.frozendo.com/frozenway/download/linux-x86_64/$pkgver")
sha512sums=('c2d456ea7acbd830f0e9315a4b2f7782b966706ad3d9b89e5ab4363c595c8b54773c0a2138abadec94db75659797521b3b4e97509abfc68b0c8db31065aa5b9e'
            '6d7f694eb31bfda193dc4d33ad1e40fec1af0a64988358e7a26f1e80fd201275f0b357d8b7cecaa7961bb6d66502973d31cec7ec43bad2c59982cd8a21a0c09e'
            '72836acd2b569a34345b7b2789aa75d60eac46956a4e4d68b66f9e344dbe4677ed28b647edff0c0af940159b97eac310cb04a0880869fcf4cb0655860a8d2077')

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
