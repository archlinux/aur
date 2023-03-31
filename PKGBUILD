# Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>

pkgname=hqplayer-client
pkgver=4.21.1
_debpkgver=4.21.1-106avx2
pkgrel=2
pkgdesc="The high-end upsampling multichannel software HD-audio player - client application"
arch=('x86_64')
url="http://www.signalyst.com/consumer.html"
license=('custom')
depends=('qt6-webengine')
optdepends=('hqplayer4' 'hqplayer-embedded' 'hqplayer-embedded-sse')
source=("https://www.signalyst.com/bins/hqplayer4desktop_"$_debpkgver"_amd64.deb")
sha256sums=('a7c11af341bf8a7f1a51fd7e15ba6515404f3bae71cf4a9e8e6866a5263d34ae')
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
