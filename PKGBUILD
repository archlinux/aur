# Maintainer: Alan Beale <the dot mrabz at gmail dot com>

pkgname=nexusmods-app-bin
_pkgname=nexusmods-app
pkgver=0.5.2
pkgrel=2
_fullver=${pkgver}-${pkgrel}
pkgdesc="A mod installer, creator and manager for all your popular games."
arch=('x86_64')
url="https://github.com/Nexus-Mods/NexusMods.App"
license=('GPL-3.0-or-later')
depends=('xdg-utils' 'desktop-file-utils' 'fontconfig' 'hicolor-icon-theme')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
noextract=("NexusMods.App-${pkgver}-1.linux-x64.zip")
options=('!strip')
source=("https://github.com/Nexus-Mods/NexusMods.App/releases/download/v${pkgver}/NexusMods.App-${pkgver}-1.linux.x64.zip"
	"${_pkgname}.desktop"
	"https://github.com/Nexus-Mods/NexusMods.App/raw/v${pkgver}/src/NexusMods.App.UI/Assets/nexus-logo.svg")

sha256sums=('f2e0e28fd3a9b4b646ecafd4c14775187f876e59db512e020259d35ad80a689d'
            '076952d155049f2625eebd1565b60e5a4bcd1190424fd9db5e38b98d55f0c2cb'
            '5a22eccfb001eacbf2756f2e21fa371dbafd9e84b20bb6a484d781bde33089cb')

prepare() {
	mkdir nexusmods-app
	bsdtar -xf "${srcdir}/NexusMods.App-${pkgver}-1.linux-x64.zip" -C "${_pkgname}"
	chmod +x nexusmods-app/NexusMods.App
}

package() {
	install -d "${pkgdir}/opt"
	cp -r "${srcdir}/${_pkgname}" "${pkgdir}/opt"
	install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
	install -Dm644 "nexus-logo.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/nexusmods-app.svg"
}
