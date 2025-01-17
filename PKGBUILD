# Maintainer: DrasLorus <draslorus@draslorus.fr>
pkgname=yubioauth-flutter-bin
pkgver=7.1.1
pkgrel=1
pkgdesc="Flutter-version of the Yubikey Authenticator for Desktop"
arch=('x86_64')
url="https://github.com/Yubico/yubioath-flutter"
license=('Apache-2.0')
depends=('pcsclite'
	 'libbsd'
	 'openssl-1.1'
	 'cairo'
	 'libxext'
	 'libnotify'
	 'libxrender'
	 'gtk3'
	 'pango'
	 'libepoxy')
provides=('yubico-authenticator')
source=("https://github.com/Yubico/yubioath-flutter/releases/download/$pkgver/yubico-authenticator-$pkgver-linux.tar.gz"
	"https://github.com/Yubico/yubioath-flutter/releases/download/$pkgver/yubico-authenticator-$pkgver-linux.tar.gz.sig")
sha256sums=('f553503a810ded105254d4b537434d4870657c5240bf43c1a47afae798ace3f2'
            'SKIP')
validpgpkeys=('20EE325B86A81BCBD3E56798F04367096FBA95E8')

build() {
    sed -e "s|@EXEC_PATH|/opt/yubioauth-flutter|g" \
	<"$srcdir/yubico-authenticator-$pkgver-linux/linux_support/com.yubico.authenticator.desktop" \
	>"$srcdir/com.yubico.authenticator.desktop"
}

package() {
    # "yubico-authenticator-$pkgver-linux"
    install -d "$pkgdir/usr/share/applications" "$pkgdir/opt"
    cp -r "$srcdir/yubico-authenticator-$pkgver-linux" "$pkgdir/opt/yubioauth-flutter"
    install -m 644 "$srcdir/com.yubico.authenticator.desktop" "$pkgdir/usr/share/applications"
}
