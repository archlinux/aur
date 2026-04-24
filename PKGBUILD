# Maintainer: ABOhiccups <info@abohiccups.com>
pkgname=project-plus-netplay
pkgver='v3.1.5.2601'
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
_tag='v3.1.5-2601'
_package="Project+.$_tag.Netplay.Linux.AppImage.zip"
source=(
	"$_package::$_url/download/$_tag/Project+.$_tag.Netplay.Linux.AppImage.zip"
)
sha256sums=('345a9236cd1397e65d3d119dd11acb7423f8a335f21f47503d991a8cb3050f00')

prepare() {
    cd "$srcdir"

    appimage=$(find . -type f -name "*.AppImage" -print -quit)

    chmod +x "$appimage"
    "$appimage" --appimage-extract
}

package() {
    cd "$srcdir"
    appimage=$(find . -type f -name "*.AppImage" -print -quit)
    install -Dm755 "$appimage" "$pkgdir/usr/bin/$pkgname"
    install -dm766 "$appimage.config" "$pkgdir/usr/bin/$pkgname.config"
    install -dm766 "$appimage.home" "$pkgdir/usr/bin/$pkgname.home"
    install -Dm644 squashfs-root/usr/share/icons/hicolor/256x256/apps/project-plus-dolphin.png \
        "$pkgdir/usr/share/pixmaps/$pkgname.png"
    printf "[Desktop Entry]\nVersion=${pkgver:1}\nName=Project+ Netplay\nComment=A Mod of Super Smash Bros. Brawl with Netplay.\nPath=/usr/bin\nExec=%s\nIcon=%s\nType=Application\nCategories=Game\nKeywords=project+;brawl;netplay\n" \
        "$pkgname" "$pkgname" \
        > "$pkgdir/usr/share/applications/$pkgname.desktop"
}
