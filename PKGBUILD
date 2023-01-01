# Maintainer: ABOhiccups <https://twitter.com/ABOhiccups>
pkgname=project-plus-netplay
pkgver='v2.3.2'
pkgrel='1'
pkgdesc="A Mod of Super Smash Bros. Brawl with Netplay."
arch=('x86_64')
url="https://projectplusgame.com/"
license=('GPL')
depends=('alsa-lib' 'bluez-libs' 'cairo' 'curl' 'enet' 'ffmpeg' 'gcc-libs' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk2' 'hidapi' 'libevdev' 'libpng' 'libpulse' 'libsm' 'libusb' 'libx11' 'libxi' 'libxrandr' 'libxxf86vm' 'lzo' 'mbedtls' 'miniupnpc' 'official-gamecube-controller-adapter-rules' 'pango' 'sfml' 'systemd-libs' 'zlib')
makedepends=('cmake' 'git' 'qt5-base')
optdepends=('pulseaudio: PulseAudio backend')
options=('!strip')
_url="https://github.com/jlambert360/FPM-AppImage/releases"
_package="Faster_Project_Plus-x86-64.AppImage"
_launcher="Launcher.tar.gz"
_sd="ProjectPlusSd${pkgver:1}.tar.gz"
source=(
	"$_package::$_url/download/$pkgver/$_package"
	"$_launcher::$_url/download/$pkgver/$_launcher"
	"$_sd::$_url/download/$pkgver/$_sd"
)
sha256sums=('3740f6a90368bea51aef689e1c25d1fcb8652100b50efb2e85ff3d4cbafa7ddd' '6b67c040006f2ffd93b12595d9a6c1b51cc0b2ab53e0537f306b13872c77aa9e' '4f2fde4120834343321655241c5d77631cd03fafc28e0e98288fb5e258daa752')

prepare() {
	chmod +x "$srcdir/$_package"
	$srcdir/$_package --appimage-extract
}

package() {
	install -Dm755 "$_package" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "squashfs-root/usr/share/icons/hicolor/512x512/apps/ishiiruka.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
	install -dm644 "$pkgdir/usr/share/applications"
	printf "[Desktop Entry]\nVersion=${pkgver:1}\nName=Project+ Netplay\nComment=A Mod of Super Smash Bros. Brawl with Netplay.\nPath=/usr/bin\nExec=project-plus-netplay\nIcon=project-plus-netplay\nType=Application\nCategories=Game\nKeywords=project+;brawl;netplay\n" > "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -d "$pkgdir/$HOME/Documents/Project+ Netplay/Games"
	touch "/$pkgdir/$HOME/Documents/Project+ Netplay/Games/Place Brawl ISO here"
	cp -R "Launcher" "$pkgdir/$HOME/Documents/Project+ Netplay"
	chown -R "$USER" "$pkgdir/$HOME/Documents/Project+ Netplay"
	install -D "sd.raw" "$pkgdir/$HOME/.local/share/FasterPPlus/Wii/sd.raw"
	chown -R "$USER" "$pkgdir/$HOME/.local/share/FasterPPlus"
}
