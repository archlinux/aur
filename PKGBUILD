# Maintainer: kevku <kevku@gmx.com>
pkgname=chrome-token-signing
pkgver=1.0.6.485
pkgrel=3
epoch=1
pkgdesc="Estonian ID Card signing for Chrome. Chrome extension and native messaging client."
arch=('x86_64' 'i686')
url="http://www.id.ee/"
license=('LGPL2.1')
depends=('qt5-base' 'pcsclite' 'ccid')
makedepends=('lsb-release')
source=("https://installer.id.ee/media/ubuntu/pool/main/c/$pkgname/${pkgname}_$pkgver.orig.tar.xz")
sha256sums=('cdbaf49fe7e6076318a2770513542453ea04859168b5b03b11a43acb263ad39b')
validpgpkeys=('43650273CE9516880D7EB581B339B36D592073D4')

build() {
    cd "$srcdir/"
    export PKG_CONFIG_PATH=/usr/lib/openssl-1.0/pkgconfig
    make -f GNUmakefile Linux
}

package() {
    cd "$srcdir/host-linux"
    make INSTALL_ROOT="$pkgdir/" install

    mkdir -p $pkgdir/etc/{chromium,chromium-browser}/native-messaging-hosts
    mkdir -p $pkgdir/usr/share/{google-chrome,chromium,chromium-browser}/extensions/

    ln -sf /etc/opt/chrome/native-messaging-hosts/ee.ria.esteid.json "$pkgdir/etc/chromium/native-messaging-hosts/ee.ria.esteid.json"
    ln -sf /etc/opt/chrome/native-messaging-hosts/ee.ria.esteid.json "$pkgdir/etc/chromium-browser/native-messaging-hosts/ee.ria.esteid.json"
    ln -sf /opt/google/chrome/extensions/ckjefchnfjhjfedoccjbhjpbncimppeg.json "$pkgdir/usr/share/chromium/extensions/ckjefchnfjhjfedoccjbhjpbncimppeg.json"
    ln -sf /opt/google/chrome/extensions/ckjefchnfjhjfedoccjbhjpbncimppeg.json "$pkgdir/usr/share/chromium-browser/extensions/ckjefchnfjhjfedoccjbhjpbncimppeg.json"
    ln -sf /opt/google/chrome/extensions/ckjefchnfjhjfedoccjbhjpbncimppeg.json "$pkgdir/usr/share/google-chrome/extensions/ckjefchnfjhjfedoccjbhjpbncimppeg.json"
}
