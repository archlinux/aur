# Maintainer: Sam L. Yes <manjaroyes123@outlook.com>
pkgname=nextplayer-appimage
pkgver=1.7.5
pkgrel=1
pkgdesc="A blue-ray player for MacOS, Linux and FreeBSD, originally named TheNewPlayerFree."
arch=("x86_64")
url="https://sudormroot.github.io/nextplayer-project/"
license=("custom")
depends=('zlib' 'hicolor-icon-theme')
options=(!strip)
_filename="nextplayer-${pkgver}.AppImage"
provides=('nextplayer')
replaces=('thenewplayerfree-appimage' 'thenewplayerfree-bin')
source=("${_filename}::https://github.com/sudormroot/nextplayer-project/releases/download/nextplayer-bin.linux.1.7.5-1.amd64/nextplayer-bin.linux.1.7.5-1.amd64.AppImage")
noextract=(${_filename})
md5sums=('561a254caf4436c417c55b41cb14abfc')
_icon='/usr/share/icons/hicolor/256x256/apps/nextplayer.png'
_launcher='/usr/share/applications/nextplayer.desktop'

prepare() {
    cd ${srcdir}
    chmod +x ${_filename}
    ./${_filename} --appimage-extract
}

package() {
    install -Dm755 ${_filename} "${pkgdir}/usr/bin/nextplayer"
    install -Dm644 "squashfs-root/${_launcher}" "${pkgdir}/${_launcher}"
    install -Dm644 "squashfs-root/opt/nextplayer/share/licenses/self/LICENSE" ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    install -Dm644 "squashfs-root/${_icon}" "${pkgdir}/${_icon}"
}
