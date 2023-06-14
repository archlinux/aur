# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=qtvsplayer-bin
_appname=QtVsPlayer
pkgver=1.0.45
pkgrel=1
pkgdesc="QtVsPlayer for Hikvision, QtVsPlayer can read local video files of Hikvision and display blue, green and red vector.It read real time live stream"
arch=('aarch64' 'x86_64')
url="https://github.com/surfzoid/QtVsPlayer"
license=("GPL3")
depends=('freetype2' 'zlib' 'util-linux-libs' 'glibc' 'qt5-base' 'libx11' 'libglvnd' 'gcc-libs')
conflicts=("${pkgname%-bin}")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${url}/releases/download/${pkgver}/${_appname}_${pkgver}_bullseye-arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${url}/releases/download/${pkgver}/${_appname}_${pkgver}_ubuntu-latest-amd64.deb")
sha256sums_aarch64=('fbd8b51c5fc125821ebebe6bcbac4e3dd7176f495f86567216b335d0e035dad1')
sha256sums_x86_64=('d0e61a8ffaf33f63a7b46d4c74abdf04f43f89d171706c17d850f716339937a6')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    install -Dm755 -d "${pkgdir}/opt" "${pkgdir}/usr"
    cp -r "${srcdir}/usr/lib64/"* "${pkgdir}/opt"
    cp -r "${srcdir}/usr/share" "${pkgdir}/usr"
    install -Dm755 "${srcdir}/usr/bin/${_appname}" -t "${pkgdir}/opt/${_appname}"
    sed "s|Exec=/usr/bin/${_appname}|Exec=/opt/${_appname}/${_appname}|g;s|Path=/usr/bin|Path=/opt/${_appname}|g" -i "${pkgdir}/usr/share/applications/${_appname}.desktop"
    mv "${pkgdir}/usr/share/icons" "${pkgdir}/usr/share/pixmaps"
}