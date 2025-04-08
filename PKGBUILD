# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ziipoo-bin
_pkgname=Ziipoo
pkgver=2719v1
pkgrel=1
pkgdesc="Makes music more reliable!(Prebuilt version)壹谱,让音乐更靠谱!"
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
sha256sums=('9a3ecf99a684859e293faac13bc9e955a10808b95a96432d8b3c9037a4e35b8b'
            '292e4b39ff30f6d40e82e1f62de82842eb0a7810c35f30c33208b63bdaee5d3c'
            '6785997f9b85ec7c3c6aeaa41b347f296884d3666d6179315f82b42478e66437')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${_pkgname}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -i -e "
        s/\/usr\/share\/${pkgname%-bin}\/${pkgname%-bin}.sh/${pkgname%-bin}/g
        s/\/usr\/share\/${pkgname%-bin}\/ic_launcher.png/${pkgname%-bin}/g
        s/Audio/AudioVideo/g
    " "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib"
    cp -Pr --no-preserve=ownership "${srcdir}/usr/share/${pkgname%-bin}" "${pkgdir}/usr/lib"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.html"
    install -Dm644 "${srcdir}/usr/share/${pkgname%-bin}/ic_launcher.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}