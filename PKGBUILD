# Maintainer: ValHue <vhuelamo at gmail dot com>
#
# Contributor: ValHue <vhuelamo at gmail dot com>>
#
_pkgname="getpocket"
pkgname="${_pkgname}"-desktop
pkgver="7.0.12.0"
pkgrel="1"
pkgdesc="Pocket packaged as a desktop application"
url="https://getpocket.com/about"
arch=('x86_64')
license=('unknown')
depends=('alsa-lib' 'gconf' 'gtk2' 'libxss' 'libxtst' 'nss')
makedepends=('nodejs-nativefier')
provides=("${_pkgname}")

_getpocket_desktop="[Desktop Entry]
Encoding=UTF-8
Version=1.0
Name=Pocket
Comment=Desktop version of Pocket
Exec=getpocket-desktop
StartupWMClass=getpocket-desktop
Icon=pocket
Terminal=false
Type=Application
Categories=Network;
X-Desktop-File-Install-Version=0.22"

build() {
	cd "${srcdir}"
    echo -e "$_getpocket_desktop" | tee getpocket.desktop

	nativefier getpocket.com \
		--name 'getpocket' \
		--disable-context-menu \
		--disable-dev-tools \
		--width 800px \
		--height 600px
}

package() {
	cd "${srcdir}"
	install -D -m 644 *.desktop "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
	install -d "${pkgdir}"/{opt,usr/bin}
	cp -r getpocket-linux-x64 "${pkgdir}/opt/getpocket"

	cd "${pkgdir}"
	chmod 755 opt/getpocket/resources/app
	ln -s ../../opt/getpocket/${_pkgname} usr/bin/${pkgname}
}


# vim:set ts=4 sw=4 ft=sh et syn=sh ft=sh:
