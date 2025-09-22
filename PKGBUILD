# Maintainer: ABOhiccups <info@abohiccups.com>
pkgname=project-plus-netplay
pkgver='v3.1.2'
_tagname='3.1.2'
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
_sd="sd.tar.gz"
source=(
	"$_package::$_url/download/$pkgver/$_package"
	"$_launcher::$_url/download/$pkgver/$_launcher"
	"$_sd::$_url/download/$pkgver/$_sd"
)
sha256sums=('ead24e1ecdf024ec80a7f6ba64548a2ae9d32f0d2c867c5d35121f5cdc97742e' '1b9dce2fb0eac3ad8cc809826b3b6bfd4ce30dbfc394eaa586e35dcd356fd189' '389e4025ed3e0a79a1d0646dcc97bbd204fdfad371be72f913f59aa172f531fd')

prepare() {
	chmod +x "$srcdir/$_package"
	$srcdir/$_package --appimage-extract
}

package() {
	install -Dm755 "$_package" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "squashfs-root/usr/share/icons/hicolor/512x512/apps/ishiiruka.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
	install -dm644 "$pkgdir/usr/share/applications"
	printf "[Desktop Entry]\nVersion=${pkgver:1}\nName=Project+ Netplay\nComment=A Mod of Super Smash Bros. Brawl with Netplay.\nPath=/usr/bin\nExec=project-plus-netplay\nIcon=project-plus-netplay\nType=Application\nCategories=Game\nKeywords=project+;brawl;netplay\n" > "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -dm777 "$pkgdir/usr/share/project-plus-netplay/games"
	touch "/$pkgdir/usr/share/project-plus-netplay/games/Place Brawl ISO here"
	cp -R "Launcher" "$pkgdir/usr/share/project-plus-netplay"
 	install -Dm777 "sd.raw" "$pkgdir/usr/share/project-plus-netplay/sd.raw"
}
