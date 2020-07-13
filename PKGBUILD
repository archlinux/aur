# Maintainer: Sam L. Yes <manjaroyes123@outlook.com>
pkgname=thenewplayerfree-appimage
pkgver=1.6.8
pkgrel=1
pkgdesc="A video player for MacOS, Linux and FreeBSD."
arch=("x86_64")
url="https://sudormroot.github.io/thenewplayer_builds/"
license=("custom")
depends=('zlib' 'hicolor-icon-theme')
options=(!strip)
_pkgname="thenewplayerfree-bin.linux.dynamic-build.1.6.8-1-1.amd64.AppImage"
provides=('thenewplayerfree')
conflicts=('thenewplayerfree' 'thenewplayerfree-bin')
source=("https://github.com/sudormroot/thenewplayer_builds/releases/download/thenewplayerfree-bin.linux.dynamic-build.1.6.8-1/thenewplayerfree-bin.linux.dynamic-build.1.6.8-1-1.amd64.AppImage")
noextract=(${_pkgname})
md5sums=('493c310fc32d4a9aaf6065dac7c53d5f')
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
    install -Dm644 "squashfs-root/usr/local/thenewplayerfree/share/licenses/self/LICENSE" ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    install -Dm644 "squashfs-root/${_icon}" "${pkgdir}/${_icon}"
}
