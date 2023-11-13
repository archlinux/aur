# Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>

pkgname=hqplayer-client
pkgver=5.3.0
_debpkgver=5.3.0-6avx2
pkgrel=1
pkgdesc="The high-end upsampling multichannel software HD-audio player - client application"
arch=('x86_64' 'x86_64_v3')
url="http://www.signalyst.com/consumer.html"
license=('custom')
depends=('qt6-webengine')
optdepends=('hqplayer4' 'hqplayer5' 'hqplayer-embedded' 'hqplayer-embedded-sse')
source=("https://www.signalyst.com/bins/hqplayer5desktop_"$_debpkgver"_amd64.deb")
sha256sums=('811b63f2595a5229a63074c11cc6774be16c5586dd03bc01ad39db71b1c4b879')
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
