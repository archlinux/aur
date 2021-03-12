# Maintainer: vvxxp8 <concatenate[g] the characters[x] in square[b] brackets[1] in[5] order[3] at gmail dot com

pkgname=cajviewer-appimage
pkgver=210224
pkgrel=1
pkgdesc="CAJViewer for Linux"
arch=("x86_64")
url="http://cajviewer.cnki.net"
_pkgname="CAJViewer-${arch}-buildubuntu1604-${pkgver}.AppImage"
noextract=(${_pkgname})
options=("!strip")
provides=('cajviewer')
conflicts=('cajviewer')
source=("https://download.cnki.net/${_pkgname}")
sha512sums=("94ff061b97302ae5cf389dc70b039aff5b2ea9e67f543aee3b24ec40f89e00cca5a218741086329c54f897791309fdacb46ef76020e509b3ac1fb9b2c106ae4e")

_installdir=/opt/appimages
_installname=cajviewer

prepare() {
	cd "${srcdir}"
	chmod a+x ${_pkgname}
	${srcdir}/${_pkgname} --appimage-extract
	sed -i "s+Exec=cajviewer+Exec=env DESKTOPINTEGRATION=no ${_installdir}/${_installname}.AppImage+" "squashfs-root/cajviewer.desktop"
	find "squashfs-root/usr/share/icons/hicolor" -type d -exec chmod 755 {} \;
}

package() {
	install -dm755 "${pkgdir}/usr/share/icons"
	install -Dm755 ${_pkgname} "${pkgdir}/${_installdir}/${_installname}.AppImage"
	install -Dm644 "squashfs-root/${_installname}.desktop" "${pkgdir}/usr/share/applications/${_installname}.desktop"
	cp -R "squashfs-root/usr/share/icons/hicolor" "${pkgdir}/usr/share/icons"
}
