# Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>

pkgname=hqplayer-client
pkgver=4.22.0
_debpkgver=4.22.0-108avx2
pkgrel=1
pkgdesc="The high-end upsampling multichannel software HD-audio player - client application"
arch=('x86_64')
url="http://www.signalyst.com/consumer.html"
license=('custom')
depends=('qt6-webengine')
optdepends=('hqplayer4' 'hqplayer-embedded' 'hqplayer-embedded-sse')
source=("https://www.signalyst.com/bins/hqplayer4desktop_"$_debpkgver"_amd64.deb")
sha256sums=('9f509cae33ff54c04040a00c42f5f4918cb91bfbfdcfbaf1c4ba51e758877233')
options=(!strip)
install=${pkgname}.install

package() {
bsdtar xf data.tar.zst
install -Dm755 $srcdir/usr/bin/hqplayer4client $pkgdir/usr/bin/hqplayer4client
install -Dm644 $srcdir/usr/share/applications/hqplayer4-client.desktop $pkgdir/usr/share/applications/hqplayer4-client.desktop
install -Dm644 $srcdir/usr/share/applications/hqplayer4-client.desktop $pkgdir/usr/share/applications/hqplayer4-client-wayland.desktop
sed -i 's/\/usr\/bin\/hqplayer4client/bash -c "export QT_QPA_PLATFORM=xcb; hqplayer4client"/g' $pkgdir/usr/share/applications/hqplayer4-client-wayland.desktop
sed -i 's/HQPlayer 4 Client/HQPlayer 4 Client Wayland/g' $pkgdir/usr/share/applications/hqplayer4-client-wayland.desktop
install -Dm644 $srcdir/usr/share/pixmaps/hqplayer4-client.png $pkgdir/usr/share/pixmaps/hqplayer4-client.png
install -Dm644 $srcdir/usr/share/doc/hqplayer4desktop/copyright $pkgdir/usr/share/licenses/$pkgname/COPYING
}
