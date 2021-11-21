# Maintainer: XMiao
pkgname="techmino-client"
pkgver=0.16.5
pkgrel=1
pkgdesc="Techmino:方块研究所"
arch=('x86_64')
url="http://game.techmino.org"
license=(unknown)
depends=(fuse xorg-xrandr)
options=(!strip)
_pkgname="Techmino.AppImage"
source=("https://d.flaribbit.workers.dev/${_pkgname}")
sha256sums=('edc2fa31b034676a924d457b1a1fcd50dd60e8daf2aa0088585a15a36edf0a84')
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
