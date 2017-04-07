# Maintainer: Arti Zirk <arti.zirk@gmail.com>

_pkgname=hwcrypto-native
pkgname=$_pkgname-git
pkgver=17.3.18.r1.ga133093
pkgrel=1
pkgdesc="Web eID native component"
arch=('x86_64' 'i686')
url="https://github.com/hwcrypto/hwcrypto-native"
license=('LGPL2.1')
depends=('qt5-base' 'pcsclite' 'ccid')
makedepends=('git' 'qt5-tools')
conflicts=('hwcrypto-native')
provides=('hwcrypto-native')
options=()
source=(git+https://github.com/hwcrypto/hwcrypto-native.git)
md5sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir"/"$_pkgname"
    make -C src
}
package() {
	cd "$srcdir"/"$_pkgname"

	mkdir -p $pkgdir/usr/bin
    install -p -m 755 src/web-eid $pkgdir/usr/bin

    mkdir -p $pkgdir/etc/opt/chrome/native-messaging-hosts
    install -p -m 644 linux/org.hwcrypto.native.json $pkgdir/etc/opt/chrome/native-messaging-hosts/org.hwcrypto.native.json

    mkdir -p $pkgdir/etc/chromium/native-messaging-hosts
    install -p -m 644 linux/org.hwcrypto.native.json $pkgdir/etc/chromium/native-messaging-hosts/org.hwcrypto.native.json

    mkdir -p $pkgdir/usr/lib/mozilla/native-messaging-hosts
    install -p -m 644 linux/org.hwcrypto.native.firefox.json $pkgdir/usr/lib/mozilla/native-messaging-hosts/org.hwcrypto.native.json
}
