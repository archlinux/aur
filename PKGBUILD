# Maintainer: XMiao
pkgname="techmino-client"
pkgver=0.17.3
pkgrel=1
pkgdesc="Techmino:方块研究所"
arch=('x86_64')
url="http://home.techmino.org"
license=('(L)GPL')
depends=(fuse xorg-xrandr)
options=(!strip)
_pkgname="Techmino_a0.17.3_Linux.AppImage"
source=("https://github.com/26F-Studio/Techmino/releases/download/v${pkgver}/${_pkgname}")
sha256sums=('6b0f139dff4f182d096cfe8cbb3cd81390b5f6e3bdc22aed7986e80b1d57da54')
_installdir=/opt/appimages
_installname=techmino

prepare() {
	cd ${srcdir}
	chmod a+x ${_pkgname}
	${srcdir}/${_pkgname} --appimage-extract
    sed -i "s+wrapper-love+env DESKTOPINTEGRATION=no ${_installdir}/${_installname}.AppImage+" "squashfs-root/Techmino.desktop"
    sed -i "s/[[:space:]]%U$//" "squashfs-root/Techmino.desktop"
}

package() {
    install -Dm755 "squashfs-root/icon.png" "${pkgdir}/usr/share/icons/icon.png"
    install -Dm755 ${_pkgname} "${pkgdir}/${_installdir}/${_installname}.AppImage"
    install -Dm644 "squashfs-root/Techmino.desktop" "${pkgdir}/usr/share/applications/${_installname}.desktop"
}
