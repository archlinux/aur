# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ziipoo-bin
_pkgname=Ziipoo
pkgver=2650v1
pkgrel=2
pkgdesc="Makes music more reliable!壹谱,让音乐更靠谱!"
arch=('x86_64')
url="https://www.ziipoo.cn"
license=('LicenseRef-custom')
providers=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!strip')
depends=(
    'qt5-base'
    'libglvnd'
    'fontconfig'
    'pango'
    'libx11'
    'alsa-lib'
    'gtk2'
    'ffmpeg4.4'
    'libxi'
    'gtk3'
    'libxxf86vm'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/zpocore/download.php?os=linux_deb"
    "LICENSE-${pkgver}.html::${url}/buy/"
    "${pkgname%-bin}.sh"
)
sha256sums=('554e33183aa2a0c96ae6e5d72249cd34156a088a40fdaf3695016cb90e43f831'
            'b2ddf9f8315295cdb39a632abf45cab3c529ac7915f4a912fd80264cd9d7b3da'
            '6785997f9b85ec7c3c6aeaa41b347f296884d3666d6179315f82b42478e66437')
build() {
    sed -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${_pkgname}/g
    " -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -e "
        s/\/usr\/share\/${pkgname%-bin}\/${pkgname%-bin}.sh/${pkgname%-bin}/g
        s/\/usr\/share\/${pkgname%-bin}\/ic_launcher.png/${pkgname%-bin}/g
        s/Audio/AudioVideo/g
    " -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib"
    cp -r "${srcdir}/usr/share/${pkgname%-bin}" "${pkgdir}/usr/lib"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.html"
    install -Dm644 "${srcdir}/usr/share/${pkgname%-bin}/ic_launcher.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}