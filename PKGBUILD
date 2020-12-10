# Maintainer: vvxxp8 <concatenate[g] the characters[x] in square[b] brackets[1] in[5] order[3] at gmail dot com

pkgname=cajviewer-appimage
_installdir=/opt/${pkgname}
pkgver=201021
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
sha512sums=("04c702e563587bda4c924fb554f0aef3e63a3dff088b2cecbf21c03723352595b3d0adfe14bedd2c875960dd64c69f5e6c4318684d9bbcd60e7ec5f2fe613bc9")

prepare() {
	cd "${srcdir}"
	chmod a+x ${_pkgname}
	${srcdir}/${_pkgname} --appimage-extract
	sed -i "s+Exec=cajviewer+Exec=env DESKTOPINTEGRATION=no ${_installdir}/cajviewer.AppImage+" "squashfs-root/cajviewer.desktop"
	find "squashfs-root/usr/share/icons/hicolor" -type d -exec chmod 755 {} \;
}

package() {
	install -dm755 "${pkgdir}/usr/share/icons"
	install -Dm755 ${_pkgname} "${pkgdir}/${_installdir}/cajviewer.AppImage"
	install -Dm644 "squashfs-root/cajviewer.desktop" "${pkgdir}/usr/share/applications/cajviewer.desktop"
	cp -R "squashfs-root/usr/share/icons/hicolor" "${pkgdir}/usr/share/icons"
}
