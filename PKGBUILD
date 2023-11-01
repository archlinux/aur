# Maintainer: ABOhiccups <https://twitter.com/ABOhiccups>
pkgname=slippi-launcher
_tagname='2.11.1'
pkgver='v2.11.1.r0.g17bbc14b'
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
sha512sums=('e8159464f3bad098035eb3070c1119c11745d2d5b22064eae6cb98c504ab2321cf7f6454bd97900f21d651ac3cbe57b33b6b53385c31059785f171d69da85469')

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
