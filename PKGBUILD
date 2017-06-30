# Maintainer: kevku <kevku@gmx.com>
pkgname=chrome-token-signing
pkgver=1.0.5.468
pkgrel=1
epoch=1
pkgdesc="Estonian ID Card signing for Chrome. Chrome extension and native messaging client."
arch=('x86_64' 'i686')
url="http://www.id.ee/"
license=('LGPL2.1')
depends=('qt5-base' 'pcsclite' 'ccid')
makedepends=('lsb-release')
source=("https://installer.id.ee/media/ubuntu/pool/main/c/$pkgname/${pkgname}_$pkgver.orig.tar.xz")
sha256sums=('2bdca471480ce8a4556580a8e90adc9ce93ca6edf396d4deeaab4ad255f6ea66')
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
	mkdir -p $pkgdir/usr/lib/mozilla/native-messaging-hosts/

	ln -sf "/usr/share/$pkgname/ee.ria.esteid.json" "$pkgdir/etc/chrome/native-messaging-hosts/ee.ria.esteid.json"
	ln -sf "/usr/share/$pkgname/ee.ria.esteid.json" "$pkgdir/etc/chromium/native-messaging-hosts/ee.ria.esteid.json"
	ln -sf "/usr/share/$pkgname/ee.ria.esteid.json" "$pkgdir/etc/chromium-browser/native-messaging-hosts/ee.ria.esteid.json"
	ln -sf "/usr/share/$pkgname/ee.ria.esteid.json" "$pkgdir/etc/opt/chrome/native-messaging-hosts/ee.ria.esteid.json"
	#firefox
	install -Dm644 "host-linux/ff/ee.ria.esteid.json" "$pkgdir/usr/lib/mozilla/native-messaging-hosts/ee.ria.esteid.json"
	install -Dm644 "{443830f0-1fff-4f9a-aa1e-444bafbc7319}.xpi" "$pkgdir/usr/share/mozilla/extensions/{ec8030f7-c20a-464f-9b0e-13a3a9e97384}/{443830f0-1fff-4f9a-aa1e-444bafbc7319}.xpi"
	ln -sf "/usr/share/$pkgname/ckjefchnfjhjfedoccjbhjpbncimppeg.json" $pkgdir/usr/share/chrome/extensions/ckjefchnfjhjfedoccjbhjpbncimppeg.json
	ln -sf "/usr/share/$pkgname/ckjefchnfjhjfedoccjbhjpbncimppeg.json" $pkgdir/usr/share/google-chrome/extensions/ckjefchnfjhjfedoccjbhjpbncimppeg.json
	ln -sf "/usr/share/$pkgname/ckjefchnfjhjfedoccjbhjpbncimppeg.json" $pkgdir/usr/share/chromium/extensions/ckjefchnfjhjfedoccjbhjpbncimppeg.json
	ln -sf "/usr/share/$pkgname/ckjefchnfjhjfedoccjbhjpbncimppeg.json" $pkgdir/usr/share/chromium-browser/extensions/ckjefchnfjhjfedoccjbhjpbncimppeg.json


}
