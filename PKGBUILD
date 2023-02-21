# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=esearch-bin
_pkgname=eSearch
pkgver=1.9.8
pkgrel=1
epoch=
pkgdesc="截屏 离线OCR 搜索翻译 以图搜图 贴图 录屏 滚动截屏 Screenshot OCR search translate search for picture paste the picture on the screen screen recorder"
arch=("x86_64")
url="https://esearch-app.netlify.app/"
_githuburl="https://github.com/xushengfeng/eSearch"
license=('GPL3')
depends=(
    'alsa-lib'
    'qt5-base'
    'nss'
    'nodejs-lts-fermium'
    'gtkmm3'
    'at-spi2-core'
)
optdepends=()
provides=(filecxx)
conflicts=()
install=
source=(
    "${_pkgname}-${pkgver}-linux-x64.tar.gz::${_githuburl}/releases/download/${pkgver}/${_pkgname}-${pkgver}-linux-x64.tar.gz"
    )
sha256sums=('a50f55bf0c34869b394ee7ad0ca187bbe3ab595926cf31befdb70c9a017c7238')
  
prepare() {
    mkdir -p "${srcdir}/opt"
    mv "${srcdir}/${_pkgname}-${pkgver}-linux-x64" "${srcdir}/opt/${_pkgname}"
    sed 's/Exec=e-search/Exec=\/opt\/eSearch\/esearch/g;s/Icon=e-search/Icon=esearch-bin/g' \
        -i "${srcdir}/opt/${_pkgname}/resources/app/assets/e-search.desktop"
}
  
package() {
    cp -r ${srcdir}/opt "${pkgdir}"
    #install icons
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app/assets/icon.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
    #install license
    install -Dm644 "${srcdir}/opt/${_pkgname}/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    #install desktop
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app/assets/e-search.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
