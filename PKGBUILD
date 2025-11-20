# Maintainer: ABOhiccups <info@abohiccups.com>
pkgname=project-plus-netplay
pkgver='v3.1.5'
pkgrel='1'
pkgdesc="A Mod of Super Smash Bros. Brawl with Netplay."
arch=('x86_64')
url="https://projectplusgame.com/"
license=('GPL')
depends=('alsa-lib' 'bluez-libs' 'cairo' 'curl' 'enet' 'ffmpeg' 'gcc-libs' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk2' 'hidapi' 'libevdev' 'libpng' 'libpulse' 'libsm' 'libusb' 'libx11' 'libxi' 'libxrandr' 'libxxf86vm' 'lzo' 'mbedtls' 'miniupnpc' 'official-gamecube-controller-adapter-rules' 'pango' 'sfml' 'systemd-libs' 'zlib')
makedepends=('cmake' 'git' 'qt5-base')
optdepends=('pulseaudio: PulseAudio backend')
options=('!strip')
_url="https://github.com/Project-Plus-Development-Team/Project-Plus-Dolphin/releases"
_package="Project+.$pkgver.Netplay.Linux.AppImage.zip"
_appimage="Project-Plus-Dolphin.AppImage"
source=(
	"$_package::$_url/download/$pkgver/Project+.$pkgver.Netplay.Linux.AppImage.zip"
)
sha256sums=('05b0e6cc80b84b5693f038272238ae3a2be89d4f728ed548c950043c24aab702')

prepare() {
	chmod +x "$srcdir/$_appimage"
	$srcdir/$_appimage --appimage-extract
}

package() {
	install -Dm755 "$_appimage" "$pkgdir/usr/bin/$pkgname"
	cp -a "$_appimage.config" "$pkgdir/usr/bin/$pkgname.config"
	chmod -R 777 "$pkgdir/usr/bin/$pkgname.config"
	cp -a "$_appimage.home" "$pkgdir/usr/bin/$pkgname.home"
	chmod -R 777 "$pkgdir/usr/bin/$pkgname.home"
	install -Dm644 "squashfs-root/usr/share/icons/hicolor/256x256/apps/project-plus-dolphin.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
	install -dm644 "$pkgdir/usr/share/applications"
	printf "[Desktop Entry]\nVersion=${pkgver:1}\nName=Project+ Netplay\nComment=A Mod of Super Smash Bros. Brawl with Netplay.\nPath=/usr/bin\nExec=project-plus-netplay\nIcon=project-plus-netplay\nType=Application\nCategories=Game\nKeywords=project+;brawl;netplay\n" > "$pkgdir/usr/share/applications/$pkgname.desktop"
}
