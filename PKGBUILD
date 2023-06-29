# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=qtvsplayer-bin
_appname=QtVsPlayer
pkgver=1.0.48
pkgrel=2
pkgdesc="QtVsPlayer for Hikvision, QtVsPlayer can read local video files of Hikvision and display blue, green and red vector.It read real time live stream"
arch=('aarch64' 'x86_64')
url="https://github.com/surfzoid/QtVsPlayer"
license=("GPL3")
depends=('freetype2' 'zlib' 'util-linux-libs' 'glibc' 'qt5-base' 'libx11' 'libglvnd' 'gcc-libs' 'openal')
conflicts=("${pkgname%-bin}")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${url}/releases/download/${pkgver}/${_appname}_${pkgver}_bullseye-arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${url}/releases/download/${pkgver}/${_appname}_${pkgver}_ubuntu-latest-amd64.deb")
sha256sums_aarch64=('57a0b3e6951cb4896e133df8727ee783129c55f08e57ee9058d65c94aef3c730')
sha256sums_x86_64=('2590a942b106219a8f32949dad0022b1e7be516382ce5570dcaa8276c8eb2d05')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    install -Dm755 -d "${pkgdir}/opt" "${pkgdir}/usr"
    cp -r "${srcdir}/usr/lib64/"* "${pkgdir}/opt"
    cp -r "${srcdir}/usr/share" "${pkgdir}/usr"
    install -Dm755 "${srcdir}/usr/bin/${_appname}" -t "${pkgdir}/opt/${_appname}"
    sed "s|Exec=/usr/bin/${_appname}|Exec=/opt/${_appname}/${_appname}|g;s|Path=/usr/bin|Path=/opt/${_appname}|g" -i "${pkgdir}/usr/share/applications/${_appname}.desktop"
    mv "${pkgdir}/usr/share/icons" "${pkgdir}/usr/share/pixmaps"
}