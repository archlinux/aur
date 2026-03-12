# Maintainer: detiam <dehe_tian at outlook dot com>
# Contributor: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=esearch
pkgname="${_pkgname}-electron-bin"
pkgver=15.2.3
pkgrel=2
pkgdesc="Screenshot OCR search translate search for picture paste the picture on the screen screen recorder. (with system electron)"
arch=("x86_64")
url="https://esearch-app.netlify.app/"
_githuburl="https://github.com/xushengfeng/eSearch"
license=('GPL3')
options=(!strip)

depends=('electron' 'at-spi2-core' 'hicolor-icon-theme' 'libnotify' 'libsecret' 'libxss' 'libxtst' 'util-linux-libs')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-appimage" "${_pkgname}-bin")

source=("${_githuburl}/releases/download/${pkgver}/eSearch-${pkgver}-linux-x64.tar.gz"
        "e-search.sh")
sha256sums=('63f9364624c257402fe881b90a0813aa9257e4fc6b9bd7e10bf1f3d3444a95f8'
            '44e82260c571f1e7b6daa9d88240d8212365b71089bda05fab11858973f0ba83')

package() {
    install -Dm755 "e-search.sh" "${pkgdir}/usr/bin/e-search"
    install -dm755 "${pkgdir}/usr/lib/"
    install -dm755 "${pkgdir}/usr/share/applications"
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
    cd "eSearch-${pkgver}-linux-x64"
    ln -s "/usr/lib/esearch/assets/e-search.desktop" "${pkgdir}/usr/share/applications/"
    ln -s "/usr/lib/esearch/assets/icon.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/esearch.svg"
    cp -r --no-preserve=ownership "./resources/app" "${pkgdir}/usr/lib/esearch"
    export LC_ALL="$LANG"
}
