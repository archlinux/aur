# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=qtvsplayer-bin
_appname=QtVsPlayer
pkgver=1.0.43
pkgrel=1
pkgdesc="QtVsPlayer for Hikvision, QtVsPlayer can read local video files of Hikvision and display blue, green and red vector.It read real time live stream"
arch=('x86_64')
url="https://github.com/surfzoid/QtVsPlayer"
license=("GPL3")
depends=('freetype2' 'zlib' 'util-linux-libs' 'glibc' 'qt5-base' 'libx11' 'libglvnd' 'gcc-libs')
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/${pkgver}/${_appname}_${pkgver}_ubuntu-latest-amd64.deb")
sha256sums=('4c2f8df8add429098c59183f8bd1bc42f710bb05de832f5d574d66ae843da9b8')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    install -Dm755 -d "${pkgdir}/opt" "${pkgdir}/usr"
    cp -r "${srcdir}/usr/lib64/"* "${pkgdir}/opt"
    cp -r "${srcdir}/usr/share" "${pkgdir}/usr"
    install -Dm755 "${srcdir}/usr/bin/${_appname}" -t "${pkgdir}/opt/${_appname}"
    sed "s|Exec=/usr/bin/${_appname}|Exec=/opt/${_appname}/${_appname}|g;s|Path=/usr/bin|Path=/opt/${_appname}|g" -i "${pkgdir}/usr/share/applications/${_appname}.desktop"
    mv "${pkgdir}/usr/share/icons" "${pkgdir}/usr/share/pixmaps"
}