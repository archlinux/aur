# Maintainer: Alan Beale <the dot mrabz at gmail dot com>

pkgname=nexusmods-app-bin
_pkgname=nexusmods-app
pkgver=0.5.1
pkgrel=1
_fullver=${pkgver}-${pkgrel}
pkgdesc="A mod installer, creator and manager for all your popular games."
arch=('x86_64')
url="https://github.com/Nexus-Mods/NexusMods.App"
license=('GPL-3.0-or-later')
depends=('xdg-utils' 'desktop-file-utils' 'snappy' 'fontconfig')
noextract=("NexusMods.App-${_fullver}.linux-x64.zip")
options=('!strip')
source=("https://github.com/Nexus-Mods/NexusMods.App/releases/download/v0.5.1/NexusMods.App-${_fullver}.linux-x64.zip"
	"${_pkgname}.desktop"
	"https://raw.githubusercontent.com/Nexus-Mods/NexusMods.App/main/src/NexusMods.App.UI/Assets/nexus-logo.svg")

sha256sums=('1e50a44c7cb6e4c1d966417eeacc750a636b0687ba3e3d6fee7cbdde3cdddf0c'
            '0ff4c4f6557901799a846796f48049f69cf7f59ab24a4f924da436f29fa6c497'
            '5a22eccfb001eacbf2756f2e21fa371dbafd9e84b20bb6a484d781bde33089cb')

prepare() {
	mkdir nexusmods-app
	bsdtar -xf "${srcdir}/NexusMods.App-${_fullver}.linux-x64.zip" -C "${_pkgname}"
	chmod +x nexusmods-app/NexusMods.App
}

package() {
	install -d "${pkgdir}/opt"
	install -d "${pkgdir}/usr/share/icons"
	cp -r "${srcdir}/${_pkgname}" "${pkgdir}/opt"
	install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
	install -Dm644 "nexus-logo.svg" "${pkgdir}/usr/share/icons/nexusmods-app.svg"
}
