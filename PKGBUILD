# Maintainer: Philip Abernethy<chais.z3r0@gmail.com>
pkgname=steamworlddig
pkgver=1.10
epoch=1393468453
pkgrel=2
pkgdesc="A platform mining adventure with strong Metroidvanian influences."
url="http://steamworldgames.com/dig/"
arch=('x86_64' 'i686')
license=('custom:commercial')
depends_x86_64=('lib32-glew' 'lib32-libogg' 'lib32-libpng' 'lib32-libvorbis' 'lib32-openal' 'lib32-sdl')
depends_i686=('glew' 'libogg' 'libpng' 'libvorbis' 'openal' 'sdl')

DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf."; exit 1')
source=("hib://SteamWorldDig_linux_${epoch}.tar.gz")
sha512sums=('949ab0a7deef14a4ce28d18c40e63d4ac444fa2c53a5b2ed63af118ccfee3e9a7d4bd2d5900036da57bb0bc7db81cbe50aa6ea4e7682abe7c33fb4b53a53c9cb')

package() {
	cd "${srcdir}/SteamWorldDig"
	find BundlePC -type d -exec install -dm755 "${pkgdir}/opt/${pkgname}/"{} \;
	find BundlePC -type f -exec install -m644 {} "${pkgdir}/opt/${pkgname}/"{} \;
	install -Dm644 icon.png "${pkgdir}"/usr/share/pixmaps/${pkgname}.png
	ln -s /usr/share/pixmaps/${pkgname}.png "${pkgdir}"/opt/${pkgname}/icon.png
	install -m755 SteamWorldDig "${pkgdir}"/opt/${pkgname}/
	install -Dm644 readme.txt "${pkgdir}"/usr/share/doc/${pkgname}/readme.txt
	install -dm755 "${pkgdir}"/usr/bin
	echo "\#!/usr/bin/env sh
cd /opt/${pkgname}
./SteamWorldDig" > "${pkgdir}"/usr/bin/${pkgname}
	chmod 755 "${pkgdir}"/usr/bin/${pkgname}
	install -dm755 "${pkgdir}"/usr/share/applications
	echo "[Desktop Entry]
Encoding=UTF-8
Name=SteamWorld Dig
Comment=${pkgdesc}
Type=Application
Exec=\"${pkgname}\"
TryExec=${pkgname}
Icon=${pkgname}
Categories=Game;AdventureGame;" > "${pkgdir}"/usr/share/applications/imageform-SteamWorldDig.desktop
	chmod 644 "${pkgdir}"/usr/share/applications/imageform-SteamWorldDig.desktop
}
