# Maintainer: ABOhiccups <https://twitter.com/ABOhiccups>
pkgname=slippi-launcher
_tagname='2.5.4'
pkgver='v2.5.4.r0.gf06defa1'
pkgrel=2
pkgdesc="The way to play Slippi Online and watch replays."
arch=('x86_64')
url="https://slippi.gg/"
license=('GPL3')
depends=('alsa-lib' 'bluez-libs' 'curl' 'enet' 'ffmpeg' 'fuse2' 'gcc-libs' 'glibc' 'hidapi' 'libevdev' 'libglvnd' 'libpng' 'libpulse' 'libusb' 'libx11' 'libxi' 'libxrandr' 'lzo' 'mbedtls' 'miniupnpc' 'official-gamecube-controller-adapter-rules' 'pugixml' 'qt5-base' 'sfml' 'systemd-libs' 'zlib')
makedepends=('cmake' 'git' 'ninja' 'python')
optdepends=('pulseaudio: PulseAudio backend')
options=('!strip')
_url="https://github.com/project-slippi/$pkgname/releases"
_package="Slippi-Launcher-$_tagname-$arch.AppImage"
source=("$_package::$_url/download/v$_tagname/$_package")
sha512sums=('1788e1217f0dfd1dbd60b7b7a88a07147b68f549b6afbfbdc8d8062000da1a41270052f28a59fbf6805bdc4f05574ca1067f142b716018468a5d83322475b312')

prepare() {
	chmod +x "$srcdir/$_package"
	$srcdir/$_package --appimage-extract
}

package() {
	install -Dm755 "$_package" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "squashfs-root/usr/share/icons/hicolor/512x512/apps/$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
	install -dm644 "$pkgdir/usr/share/applications"
	printf "[Desktop Entry]\nVersion=$pkgver\nName=Slippi Launcher\nComment=The way to play Slippi Online and watch replays.\nPath=/usr/bin\nExec=slippi-launcher\nIcon=slippi-launcher\nType=Application\nCategories=Game\nKeywords=slippi;melee;rollback\n" > "$pkgdir/usr/share/applications/$pkgname.desktop"
}
