# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=qtvsplayer-bin
_appname=QtVsPlayer
pkgver=1.0.46
pkgrel=1
pkgdesc="QtVsPlayer for Hikvision, QtVsPlayer can read local video files of Hikvision and display blue, green and red vector.It read real time live stream"
arch=('aarch64' 'x86_64')
url="https://github.com/surfzoid/QtVsPlayer"
license=("GPL3")
depends=('freetype2' 'zlib' 'util-linux-libs' 'glibc' 'qt5-base' 'libx11' 'libglvnd' 'gcc-libs' 'openal')
conflicts=("${pkgname%-bin}")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${url}/releases/download/${pkgver}/${_appname}_${pkgver}_bullseye-arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${url}/releases/download/${pkgver}/${_appname}_${pkgver}_ubuntu-latest-amd64.deb")
sha256sums_aarch64=('04bc6eb3865463cc756f40c82bf159fe0c00d3ca86be4a2de008f8077c97cf7e')
sha256sums_x86_64=('8ccaa29a2c8564dde5848de1da5160d5f8bfda0828d3806803341a427282a99d')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    install -Dm755 -d "${pkgdir}/opt" "${pkgdir}/usr"
    cp -r "${srcdir}/usr/lib64/"* "${pkgdir}/opt"
    cp -r "${srcdir}/usr/share" "${pkgdir}/usr"
    install -Dm755 "${srcdir}/usr/bin/${_appname}" -t "${pkgdir}/opt/${_appname}"
    sed "s|Exec=/usr/bin/${_appname}|Exec=/opt/${_appname}/${_appname}|g;s|Path=/usr/bin|Path=/opt/${_appname}|g" -i "${pkgdir}/usr/share/applications/${_appname}.desktop"
    mv "${pkgdir}/usr/share/icons" "${pkgdir}/usr/share/pixmaps"
}