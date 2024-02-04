# Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>

pkgname=hqplayer-client
pkgver=5.4.2
_debpkgver=5.4.2-12avx2
pkgrel=1
pkgdesc="The high-end upsampling multichannel software HD-audio player - client application"
arch=('x86_64' 'x86_64_v3')
url="http://www.signalyst.com/consumer.html"
license=('custom')
depends=('qt6-webengine')
optdepends=('hqplayer4' 'hqplayer5' 'hqplayer-embedded' 'hqplayer-embedded-sse')
source=("https://www.signalyst.com/bins/jammy/hqplayer5desktop_"$_debpkgver"_amd64.deb")
sha256sums=('d303682bea870eded4f4dbe060963993ad9ccb49cb96edc56395c984c1d9ad55')
options=(!strip)
install=${pkgname}.install

package() {
bsdtar xf data.tar.zst
install -Dm755 $srcdir/usr/bin/hqplayer5client $pkgdir/usr/bin/hqplayer5client
install -Dm644 $srcdir/usr/share/applications/hqplayer5client.desktop $pkgdir/usr/share/applications/hqplayer5client.desktop
install -Dm644 $srcdir/usr/share/applications/hqplayer5client.desktop $pkgdir/usr/share/applications/hqplayer5client-wayland.desktop
sed -i 's/\/usr\/bin\/hqplayer5client/bash -c "export QT_QPA_PLATFORM=xcb; hqplayer5client"/g' $pkgdir/usr/share/applications/hqplayer5client-wayland.desktop
sed -i 's/HQPlayer 5 Client/HQPlayer 5 Client Wayland/g' $pkgdir/usr/share/applications/hqplayer5client-wayland.desktop
install -Dm644 $srcdir/usr/share/pixmaps/hqplayer5client.png $pkgdir/usr/share/pixmaps/hqplayer5client.png
install -Dm644 $srcdir/usr/share/doc/hqplayer5desktop/copyright $pkgdir/usr/share/licenses/$pkgname/COPYING
}
