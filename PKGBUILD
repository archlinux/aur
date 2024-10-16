# Maintainer: Alan Beale <the dot mrabz at gmail dot com>

pkgname=nexusmods-app-bin
_pkgname=nexusmods-app
pkgver=0.6.2
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
	"https://github.com/Nexus-Mods/NexusMods.App/raw/v${pkgver}/src/NexusMods.App.UI/Assets/nexus-logo.svg"
	"https://github.com/Nexus-Mods/NexusMods.App/raw/v${pkgver}/src/NexusMods.App/com.nexusmods.app.desktop"
	"nexusmods-app-bin.install")

sha256sums=('c1f5bdf9ac67ce05f619f966cbdb2f621d12ebb2b5da34a6552ddea03c528d45'
            '5a22eccfb001eacbf2756f2e21fa371dbafd9e84b20bb6a484d781bde33089cb'
            '81fb221fbca5b4d14b025fb48afc1d9a3a5428f40f93766b4ead4b3474e9ca45'
            'ed5da03be09bc9705a44072e1543ecd01d8516ba197dabb57cf315b5c34949ee')
install="nexusmods-app-bin.install"
prepare() {
	mkdir nexusmods-app
	bsdtar -xf "${srcdir}/NexusMods.App-${pkgver}-1.linux-x64.zip" -C "${_pkgname}"
	chmod +x nexusmods-app/NexusMods.App
	sed -i 's^${INSTALL_EXEC}^/opt/nexusmods-app/NexusMods.App^g' com.nexusmods.app.desktop
}

package() {
	install -d "${pkgdir}/opt"
	cp -r "${srcdir}/${_pkgname}" "${pkgdir}/opt"
	install -Dm644 "com.nexusmods.app.desktop" "${pkgdir}/usr/share/applications/com.nexusmods.app.desktop"
	install -Dm644 "nexus-logo.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/com.nexusmods.app.svg"
}
