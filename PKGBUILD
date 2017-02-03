# Maintainer: kevku <kevku@gmx.com>
pkgname=chrome-token-signing
pkgver=1.0.4.464
pkgrel=1
epoch=1
pkgdesc="Estonian ID Card signing for Chrome. Chrome extension and native messaging client."
arch=('x86_64' 'i686')
url="http://www.id.ee/"
license=('LGPL2.1')
depends=('qt5-base' 'pcsclite' 'ccid')
makedepends=('lsb-release')
source=("https://installer.id.ee/media/ubuntu/pool/main/c/$pkgname/${pkgname}_$pkgver.orig.tar.xz")
sha256sums=('06acea0bd9f5c0a361956c06edbb479de93fe47cf2b7c261c105624ee01b7748')
validpgpkeys=('43650273CE9516880D7EB581B339B36D592073D4')

build() {
	cd "$srcdir/"
        make
}

package() {
	cd "$srcdir/"
	install -Dm755 host-linux/$pkgname "$pkgdir/usr/bin/$pkgname"
	install -Dm644 host-linux/ee.ria.esteid.json "$pkgdir/usr/share/$pkgname/ee.ria.esteid.json"
	install -Dm644 ckjefchnfjhjfedoccjbhjpbncimppeg.json "$pkgdir/usr/share/$pkgname/ckjefchnfjhjfedoccjbhjpbncimppeg.json"
	
	mkdir -p $pkgdir/etc/{opt/chrome,chrome,chromium,chromium-browser}/native-messaging-hosts
	mkdir -p $pkgdir/usr/share/{chrome,google-chrome,chromium,chromium-browser}/extensions/
	
	ln -sf "/usr/share/$pkgname/ee.ria.esteid.json" "$pkgdir/etc/chrome/native-messaging-hosts/ee.ria.esteid.json"
	ln -sf "/usr/share/$pkgname/ee.ria.esteid.json" "$pkgdir/etc/chromium/native-messaging-hosts/ee.ria.esteid.json"
	ln -sf "/usr/share/$pkgname/ee.ria.esteid.json" "$pkgdir/etc/chromium-browser/native-messaging-hosts/ee.ria.esteid.json"
	ln -sf "/usr/share/$pkgname/ee.ria.esteid.json" "$pkgdir/etc/opt/chrome/native-messaging-hosts/ee.ria.esteid.json"
	
	ln -sf "/usr/share/$pkgname/ckjefchnfjhjfedoccjbhjpbncimppeg.json" $pkgdir/usr/share/chrome/extensions/ckjefchnfjhjfedoccjbhjpbncimppeg.json
	ln -sf "/usr/share/$pkgname/ckjefchnfjhjfedoccjbhjpbncimppeg.json" $pkgdir/usr/share/google-chrome/extensions/ckjefchnfjhjfedoccjbhjpbncimppeg.json
	ln -sf "/usr/share/$pkgname/ckjefchnfjhjfedoccjbhjpbncimppeg.json" $pkgdir/usr/share/chromium/extensions/ckjefchnfjhjfedoccjbhjpbncimppeg.json
	ln -sf "/usr/share/$pkgname/ckjefchnfjhjfedoccjbhjpbncimppeg.json" $pkgdir/usr/share/chromium-browser/extensions/ckjefchnfjhjfedoccjbhjpbncimppeg.json


}
