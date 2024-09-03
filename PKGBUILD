# Maintainer: Arghyadip Chakraborty <dev@arghyac.com>

pkgname=youtube-pake
_pkgname=YouTube
_appname=you-tube
pkgver=2.5.1
pkgrel=1
pkgdesc="${_pkgname} desktop app packaged by Pake"
arch=('x86_64')
url="https://www.youtube.com"
_ghurl="https://github.com/tw93/Pake"
license=('MIT')
depends=(
    'gtk3'
    'webkit2gtk'
)
options=(!debug)
source=(
    "${_pkgname// /}-${pkgver}.deb::${_ghurl}/releases/download/V${pkgver}/${_pkgname// /}_${CARCH}.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/tw93/Pake/V${pkgver}/LICENSE"
)
sha256sums=(
    'b7846e042250e64d7e2a3eeff418bc8fdbf4900b3cedcc37d68da8748e895607'
    '462d57d8d84d48d7b40c9d2464f47be9898b3cb750690b1822587f653da06758'
)
build() {
    bsdtar -xf "${srcdir}/data."*
    sed "/^Name\[zh_CN\]/d;s/Name=.*/Name=${_pkgname}/;s/Office/AudioVideo;Audio;Video/;s/com-pake-${_appname//-/}/${pkgname%-pake}/" -i "${srcdir}/usr/share/applications/com-pake-${_appname//-/}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${_appname}" "${pkgdir}/usr/bin/${pkgname%-pake}"
    install -Dm644 "${srcdir}/usr/share/applications/com-pake-${_appname//-/}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-pake}.desktop"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/512x512/apps/${_appname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-pake}.png"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
