# Maintainer: liyp <my@liyp.cc>
pkgname=tidgi-appimage
pkgver=0.8.0
pkgrel=1
pkgdesc="Customizable personal knowledge-base with Github as unlimited storage and blogging platform."
arch=('aarch64' 'x86_64')
conflicts=("${pkgname%-appimage}")
url="https://tidgi.fun/"
_githuburl="https://github.com/tiddly-gittly/TidGi-Desktop"
license=('MPL2')
depends=('glibc' 'zlib')
options=(!strip)
_install_path="/opt/appimages"
source_aarch64=("${pkgname%-appimage}-${pkgver}-aarch64.AppImage::${_githuburl}/releases/download/v${pkgver}/TidGi-${pkgver}-arm64.AppImage")
source_x86_64=("${pkgname%-appimage}-${pkgver}-x86_64.AppImage::${_githuburl}/releases/download/v${pkgver}/TidGi-${pkgver}-x64.AppImage")
source=("LICENSE::https://raw.githubusercontent.com/tiddly-gittly/TidGi-Desktop/master/LICENSE")
sha512sums=('75e77d3b0ea76296483fe50f695aae6c581508b527fabcd82858854d24a2ed4649d5edb359a4d437787e3b2f17a75340c6c53088d4dc871164d8f00bfd137d54')
sha512sums_aarch64=('fe69cd2f10188f8df8fa81100859123ea40e577d1501a75cff1139b069059867a1aa7f4e4f0d13e3cedea3df7055d583d5b1bcdd2f968db626273f7bacd963f8')
sha512sums_x86_64=('d28ded7b1d5c60a0c7109fcf4dfe7ad031b9155887c2c7c9ac69ddaae4ffd60416729421d47798443a6f35caf07c12902524e52e55f2035c73094f83a81b5072')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage"
    "${srcdir}/${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    sed "s|Exec=${pkgname%-appimage}|Exec=${_install_path}/${pkgname%-appimage}.AppImage|g" -i "${srcdir}/squashfs-root/TidGi.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/TidGi.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}