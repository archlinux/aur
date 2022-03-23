# Maintainer: XMiao
pkgname="techmino-client"
pkgver=0.17.2
pkgrel=1
pkgdesc="Techmino:方块研究所"
arch=('x86_64')
url="http://home.techmino.org"
license=('(L)GPL')
depends=(fuse xorg-xrandr)
options=(!strip)
_pkgname="Techmino_a0.17.2_Linux.AppImage"
source=("https://d.flaribbit.workers.dev/${_pkgname}")
sha256sums=('1d167b1b56aab65a65294643416c91c4ecd77a773e4a9ff4438467c2fa4f669d')
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
