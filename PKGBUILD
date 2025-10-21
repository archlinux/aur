# Maintainer: Alan Beale <the dot mrabz at gmail dot com>

pkgname=nexusmods-app-bin
_pkgname=nexusmods-app
pkgver=0.19.4
pkgrel=1
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
source=("https://github.com/Nexus-Mods/NexusMods.App/releases/download/v${pkgver}/NexusMods.App-${pkgver}-1.linux-x64.zip"
	"${pkgname}-${pkgver}.svg::https://github.com/Nexus-Mods/NexusMods.App/raw/v${pkgver}/src/NexusMods.App.UI/Assets/nexus-logo.svg"
	"${pkgname}-${pkgver}.desktop::https://github.com/Nexus-Mods/NexusMods.App/raw/v${pkgver}/src/NexusMods.App/com.nexusmods.app.desktop"
	"nexusmods-app-bin.install")

sha256sums=('0e627907e4dbe08b5fd432ef88c5e15442e4a484c45d7c948c819b11967b12dd'
            '5a22eccfb001eacbf2756f2e21fa371dbafd9e84b20bb6a484d781bde33089cb'
            '32dbc2977aaba2d5013a2534462da9d4c2534c3d2ef4391505bcd6a287ae8925'
            '4bac4c5db66d92ebb80285ecc2c4ec5fb4d738d68ad5bde10f6058cfbf03a445')
install="nexusmods-app-bin.install"
optdepends=('xdg-desktop-portal-dde: Deepin'
            'xdg-desktop-portal-gnome: GNOME'
            'xdg-desktop-portal-gtk: Generic Desktop'
            'xdg-desktop-portal-kde: KDE Plasma'
            'xdg-desktop-portal-liri-git: Liri'
            'xdg-desktop-portal-td: theDesk')

prepare() {
	mkdir nexusmods-app
	bsdtar -xf "${srcdir}/NexusMods.App-${pkgver}-1.linux-x64.zip" -C "${_pkgname}"
	chmod +x nexusmods-app/NexusMods.App
	sed -i 's^${INSTALL_EXEC}^/opt/nexusmods-app/NexusMods.App^g' ${pkgname}-${pkgver}.desktop
	sed -i 's^${INSTALL_TRYEXEC}^/opt/nexusmods-app/NexusMods.App^g' ${pkgname}-${pkgver}.desktop
}

package() {
	install -d "${pkgdir}/opt"
	cp -r "${srcdir}/${_pkgname}" "${pkgdir}/opt"
	install -Dm644 "${pkgname}-${pkgver}.desktop" "${pkgdir}/usr/share/applications/com.nexusmods.app.desktop"
	install -Dm644 "${pkgname}-${pkgver}.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/com.nexusmods.app.svg"
}
