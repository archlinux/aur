# Maintainer: Your Name <youremail@domain.com>
pkgname=chrome-token-signing
pkgver=3.9.0.374
pkgrel=2
pkgdesc="Estonian ID Card signing for Chrome. Chrome extension and native messaging client."
arch=('x86_64' 'i686')
url="http://www.id.ee/"
license=('LGPL2.1')
depends=('gtkmm3' 'pcsclite' 'ccid')
source=("https://installer.id.ee/media/sources/${pkgname}-${pkgver}.tar.gz"
        "https://installer.id.ee/media/sources/${pkgname}-${pkgver}.tar.gz.asc")
sha256sums=('6055149e110d290ac93e52ee904d2ebdd43d5a5a7d6b242b8d5f28dec0bb7111'
            'SKIP')
validpgpkeys=('43650273CE9516880D7EB581B339B36D592073D4')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
        rm json/jsonxx.o
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
        make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 out/$pkgname "$pkgdir/usr/bin/$pkgname"
	install -Dm644 ee.ria.esteid.json "$pkgdir/usr/share/$pkgname/native-messaging-hosts/ee.ria.esteid.json"
	install -Dm644 esteid_policy.json "$pkgdir/usr/share/$pkgname/policies/managed/esteid_policy.json"
	install -Dm644 $pkgname.crx "$pkgdir/usr/share/$pkgname/$pkgname.crx"
	install -Dm644 update.xml "$pkgdir/usr/share/$pkgname/update.xml"
	mkdir -p $pkgdir/etc/{chrome,chromium,chromium-browser}/native-messaging-hosts
	mkdir -p $pkgdir/etc/{chrome,chromium,chromium-browser}/policies/managed
	mkdir -p $pkgdir/etc/opt/chrome/native-messaging-hosts
	mkdir -p $pkgdir/etc/opt/chrome/policies/managed
	
	ln -sf "/usr/share/$pkgname/native-messaging-hosts/ee.ria.esteid.json" "$pkgdir/etc/chrome/native-messaging-hosts/ee.ria.esteid.json" 
	ln -sf "/usr/share/$pkgname/policies/managed/esteid_policy.json" "$pkgdir/etc/chrome/policies/managed/esteid_policy.json"
	ln -sf "/usr/share/$pkgname/native-messaging-hosts/ee.ria.esteid.json" "$pkgdir/etc/chromium/native-messaging-hosts/ee.ria.esteid.json" 
	ln -sf "/usr/share/$pkgname/policies/managed/esteid_policy.json" "$pkgdir/etc/chromium/policies/managed/esteid_policy.json"
	ln -sf "/usr/share/$pkgname/native-messaging-hosts/ee.ria.esteid.json" "$pkgdir/etc/chromium-browser/native-messaging-hosts/ee.ria.esteid.json" 
	ln -sf "/usr/share/$pkgname/policies/managed/esteid_policy.json" "$pkgdir/etc/chromium-browser/policies/managed/esteid_policy.json"
	ln -sf "/usr/share/$pkgname/native-messaging-hosts/ee.ria.esteid.json" "$pkgdir/etc/opt/chrome/native-messaging-hosts/ee.ria.esteid.json" 
	ln -sf "/usr/share/$pkgname/policies/managed/esteid_policy.json" "$pkgdir/etc/opt/chrome/policies/managed/esteid_policy.json"
	
	
	
}
