# Maintainer: kevku <kevku@gmx.com>
pkgname=chrome-token-signing
pkgver=1.0.0.388
pkgrel=3
epoch=1
pkgdesc="Estonian ID Card signing for Chrome. Chrome extension and native messaging client."
arch=('x86_64' 'i686')
url="http://www.id.ee/"
license=('LGPL2.1')
depends=('qt5-base' 'pcsclite' 'ccid')
makedepends=('lsb-release')
source=("https://installer.id.ee/media/ubuntu/pool/main/c/$pkgname/${pkgname}_$pkgver.orig.tar.gz")
sha256sums=('af078b2734b9a4cf661d97c4a5f9e9b9feb2bb03c453b53584c94805c50c6a60')
validpgpkeys=('43650273CE9516880D7EB581B339B36D592073D4')

build() {
	cd "$srcdir/$pkgname-$pkgver"
        make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 host-linux/$pkgname "$pkgdir/usr/bin/$pkgname"
	install -Dm644 host-linux/ee.ria.esteid.json "$pkgdir/usr/share/$pkgname/ee.ria.esteid.json"
	install -Dm644 ckjefchnfjhjfedoccjbhjpbncimppeg.json "$pkgdir/usr/share/$pkgname/ckjefchnfjhjfedoccjbhjpbncimppeg.json"
	
	mkdir -p $pkgdir/etc/{opt/chrome,chrome,chromium,chromium-browser,opera}/native-messaging-hosts
	mkdir -p $pkgdir/usr/share/{chrome,google-chrome,chromium,chromium-browser,opera}/extensions/
	
	ln -sf "/usr/share/$pkgname/ee.ria.esteid.json" "$pkgdir/etc/chrome/native-messaging-hosts/ee.ria.esteid.json"
	ln -sf "/usr/share/$pkgname/ee.ria.esteid.json" "$pkgdir/etc/chromium/native-messaging-hosts/ee.ria.esteid.json"
	ln -sf "/usr/share/$pkgname/ee.ria.esteid.json" "$pkgdir/etc/chromium-browser/native-messaging-hosts/ee.ria.esteid.json"
	ln -sf "/usr/share/$pkgname/ee.ria.esteid.json" "$pkgdir/etc/opt/chrome/native-messaging-hosts/ee.ria.esteid.json"
	ln -sf "/usr/share/$pkgname/ee.ria.esteid.json" "$pkgdir/etc/opera/native-messaging-hosts/ee.ria.esteid.json"
	
	ln -sf "/usr/share/$pkgname/ckjefchnfjhjfedoccjbhjpbncimppeg.json" $pkgdir/usr/share/chrome/extensions/ckjefchnfjhjfedoccjbhjpbncimppeg.json
	ln -sf "/usr/share/$pkgname/ckjefchnfjhjfedoccjbhjpbncimppeg.json" $pkgdir/usr/share/google-chrome/extensions/ckjefchnfjhjfedoccjbhjpbncimppeg.json
	ln -sf "/usr/share/$pkgname/ckjefchnfjhjfedoccjbhjpbncimppeg.json" $pkgdir/usr/share/chromium/extensions/ckjefchnfjhjfedoccjbhjpbncimppeg.json
	ln -sf "/usr/share/$pkgname/ckjefchnfjhjfedoccjbhjpbncimppeg.json" $pkgdir/usr/share/chromium-browser/extensions/ckjefchnfjhjfedoccjbhjpbncimppeg.json
	ln -sf "/usr/share/$pkgname/ckjefchnfjhjfedoccjbhjpbncimppeg.json" $pkgdir/usr/share/opera/extensions/ckjefchnfjhjfedoccjbhjpbncimppeg.json


}
