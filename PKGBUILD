# Contributor: Alexandru Ianu <alexandru.ianu@gmail.com>
# Maintainer: Alexandru Ianu <alexandru.ianu@gmail.com>
pkgname=steam-native
pkgver=1.0.0.50
pkgrel=7
pkgdesc="Sets a native runtime environment for Steam by default, adds a Steam runtime launcher for compatibility."
arch=("i686" "x86_64")
url="http://steampowered.com/"
license=('GPL2')
install="$pkgname".install
source=("https://www.dropbox.com/s/uise0l4cj9xhs6s/steam-runtime.desktop"
	"https://www.dropbox.com/s/97qxmq703f0k52c/51-steam.rules")
sha256sums=('8ce140660b4c6295ff0e580a02cebafce1ed22828561304e3f99ee78b8cfdb5d'
	'12d6d0a96e66f10eaeee94ddb6d1048c0e40a8132521fa7b00b844d6454d641c')
depends=('steam' 'libindicator-gtk2' 'libindicator-gtk3')

if [[ "$CARCH" == "i686" ]]; then
# Steam deps
	depends+=('libxinerama' 'pango' 'openal' 'gtk2' 'dbus-glib' 'libusb' 'networkmanager' 'libnl' 'polkit' 'pam' 'cracklib' 'libtirpc' 'js17' 'libpng12' 'libgcrypt15' 'systemd' 'gconf' 'nss' 'libpulse' 'libgudev')
# Common game deps
	optdepends=( 'libappindicator-gtk2: may be necessary for the tray icon' 'libappindicator-gtk3: may be necessary for the tray icon' 'sdl: game dependency' 'sdl_image: game dependency' 'sdl_mixer: game dependency' 'sdl2: game dependency' 'sdl2_image: game dependency' 'tcp_wrappers: game dependency' 'speex: game dependency' 'mono: game dependency' 'mono-addins: game dependency' 'gperftools: game dependency' 'libcurl-gnutls: game dependency')
	provides=('libudev.so.0')
	conflicts=('chromium-browser-bin' 'libudev.so.0')

	package(){
	mkdir -p "$pkgdir/usr/lib"
	ln -s /usr/lib/libudev.so ${pkgdir}/usr/lib/libudev.so.0
	mkdir -p "$pkgdir/usr/share/applications"
	cp "$srcdir/steam-runtime.desktop" "$pkgdir/usr/share/applications/steam-runtime.desktop"
	chmod +x "$pkgdir/usr/share/applications/steam-runtime.desktop"
	mkdir -p "$pkgdir/etc/polkit-1/rules.d"
	cp "$srcdir/51-steam.rules" "$pkgdir/etc/polkit-1/rules.d/51-manjaro.rules"
}

else
	source+=("https://www.dropbox.com/s/9xxku2o253ft6r0/lib32-nm09810.tar.xz")
	sha256sums+=('b56b9da85e5647ef2b8013d14378b30917d7701cd61b27ba6a39045ab5ecc529')
# Steam deps
	depends+=('lib32-libxinerama' 'lib32-pango' 'lib32-openal' 'lib32-gdk-pixbuf2' 'lib32-gtk2' 'lib32-libgcrypt15' 'lib32-dbus-glib' 'lib32-libusb' 'lib32-libnl' 'lib32-polkit' 'lib32-pam' 'lib32-cracklib' 'lib32-libtirpc' 'lib32-js17' 'lib32-libpng12' 'lib32-systemd' 'lib32-gconf' 'lib32-nss' 'lib32-libsoup' 'networkmanager' 'wpa_supplicant' 'dhcp-client' 'lib32-polkit' 'lib32-libnl' 'lib32-dbus-glib' 'iproute2' 'lib32-libpulse' 'lib32-gnutls28' 'lib32-libgudev' 'lib32-libgl' 'lib32-gcc-libs' 'lib32-libx11')
# Common game deps
	optdepends=( 'lib32-libappindicator: may be necessary for the tray icon''lib32-sdl: game dependency' 'lib32-sdl_image: game dependency' 'lib32-sdl_mixer: game dependency' 'lib32-sdl2: game dependency' 'lib32-sdl2_image: game dependency' 'lib32-tcp_wrappers: game dependency' 'lib32-speex: game dependency' 'mono: game dependency' 'mono-addins: game dependency' 'lib32-gperftools: game dependency' 'lib32-libcurl-gnutls: game dependency')
	provides=('lib32-libudev.so.0' 'lib32-networkmanager'=0.9.8.10 'lib32-libnm-glib=0.9.8.10')
	conflicts=('chromium-browser-bin' 'lib32-libudev.so.0' 'lib32-networkmanager' 'lib32-libnm-glib46')

	package(){
	mkdir -p "$pkgdir/usr/lib32"
	ln -s /usr/lib32/libudev.so ${pkgdir}/usr/lib32/libudev.so.0
	mkdir -p "$pkgdir/usr/share/applications"
	cp "$srcdir/steam-runtime.desktop" "$pkgdir/usr/share/applications/steam-runtime.desktop"
	chmod +x "$pkgdir/usr/share/applications/steam-runtime.desktop"
	tar -xJf "$srcdir/lib32-nm09810.tar.xz" -C "$pkgdir" --no-same-owner
	mkdir -p "$pkgdir/etc/polkit-1/rules.d"
	cp "$srcdir/51-steam.rules" "$pkgdir/etc/polkit-1/rules.d/51-manjaro.rules"
}
fi
