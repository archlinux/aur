# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# contributor <su975853527 at gmail dot com>
pkgname=gstarcad-bin
_pkgname="gstarsoft.${pkgname%-bin}2025"
pkgver=25.1
_subver=sp1
pkgrel=1
pkgdesc="浩辰 CAD.Free trial for 30 days"
arch=(
    'aarch64'
    'x86_64'
)
license=('LicenseRef-custom')
url="https://www.gstarcad.com/cad_linux"
_dlurl="https://official-cn.gstarcad.cn"
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
options=('!strip')
depends=(
    'qt5-base'
    'qt5-svg'
    'qt5-wayland'
    'qt5-webengine'
    'qt5-webchannel'
    'curl'
    'sqlite'
    'openssl-1.1'
    'libpng12'
    'nss'
    'lcms2'
    'libxss'
    'nspr'
    'alsa-lib'
    'libxslt'
    'libxcomposite'
    'gtest'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_dlurl}/linux/2025/241105/v10${_subver}/${pkgname%-bin}_${pkgver}_arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_dlurl}/linux/2025/241105/v10${_subver}/${pkgname%-bin}_${pkgver}_amd64.deb")
source=("${pkgname%-bin}.sh")
sha256sums=('2144610f35cf3891232da4fec7ed1ca1499d6688e2db0586508d088b47530c1f')
sha256sums_aarch64=('bbc7a5f68d32877fbfa39162550c209e4fc1a0e18b12fc5682947abed03f95f9')
sha256sums_x86_64=('547e05d33c00559041c8fdec1b9c17eb21c267fe00b6d1c4fa4050bd38796860')
prepare(){
    sed -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/gcad/g
    " -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -e "
        s/bash\ \/opt\/apps\/${_pkgname}\/files\/gclauncher.sh/${pkgname%-bin}/g
        s/\/opt\/apps\/${_pkgname}\/files\/ImageRes\/gcad.png/${pkgname%-bin}/g
    " -i "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package(){
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" -t "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/apps/${_pkgname}/files/"* "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/apps/${_pkgname}/files/ImageRes/gcad.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/opt/apps/${_pkgname}/files/ImageRes/gcad.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname%-bin}.svg"
    install -Dm644 "${srcdir}/opt/apps/${_pkgname}/files/about/en-WW/"*.html -t "${pkgdir}/usr/share/licenses/${pkgname}"
}