# Maintainer: vvxxp8 <concatenate[g] the characters[x] in square[b] brackets[1] in[5] order[3] at gmail dot com

pkgname=cajviewer-appimage
pkgver=210401
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
sha512sums=("b503d0e39300978ecf6657097f8690321155b199b24393a75c1067e52f40ad8c67a374be61c02237989de44ebb6d04698815c40a6cb4a5ca3d8bb9ac11abaf13")

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
