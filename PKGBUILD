# Maintainer: Sam L. Yes <manjaroyes123@outlook.com>
pkgname=thenewplayerfree-appimage
pkgver=1.6.9
pkgrel=1
pkgdesc="A video player for MacOS, Linux and FreeBSD."
arch=("x86_64")
url="https://sudormroot.github.io/thenewplayer_builds/"
license=("custom")
depends=('zlib' 'hicolor-icon-theme')
options=(!strip)
_pkgname="thenewplayerfree.AppImage"
provides=('thenewplayerfree')
conflicts=('thenewplayerfree' 'thenewplayerfree-bin')
source=("thenewplayerfree.AppImage::https://github.com/sudormroot/thenewplayer_builds/releases/download/thenewplayerfree-bin.linux.dynamic-build.1.6.9-1/thenewplayerfree-bin.linux.dynamic-build.1.6.9-1.amd64.AppImage")
noextract=(${_pkgname})
md5sums=('c4bf4c8de58de6ac369242522e850764')
_icon='/usr/share/icons/hicolor/256x256/apps/thenewplayerfree.png'
_launcher='/usr/share/applications/thenewplayerfree.desktop'

prepare() {
    cd ${srcdir}
    chmod +x ${_pkgname}
    ./${_pkgname} --appimage-extract
}

package() {
    install -Dm755 ${_pkgname} "${pkgdir}/usr/bin/thenewplayerfree"
    install -Dm644 "squashfs-root/${_launcher}" "${pkgdir}/${_launcher}"
    install -Dm644 "squashfs-root/opt/thenewplayerfree/share/licenses/self/LICENSE" ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    install -Dm644 "squashfs-root/${_icon}" "${pkgdir}/${_icon}"
}
