# Maintainer: detiam <dehe_tian at outlook dot com>
# Contributor: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=esearch
pkgname="${_pkgname}-electron-bin"
pkgver=1.10.1
pkgrel=14
pkgdesc="Screenshot OCR search translate search for picture paste the picture on the screen screen recorder. (with system electron)"
arch=("x86_64")
url="https://esearch-app.netlify.app/"
_githuburl="https://github.com/xushengfeng/eSearch"
license=('GPL3')
options=(!strip)

depends=('electron' 'at-spi2-core' 'hicolor-icon-theme' 'libnotify' 'libsecret' 'libxss' 'libxtst' 'util-linux-libs')
provides=("${_pkgname}")
conflicts=("${_pkgname}-appimage" "${_pkgname}-bin")

source=("${_pkgname}-${pkgver}-${pkgrel}.tar.gz::${_githuburl}/releases/download/${pkgver}-beta.${pkgrel}/eSearch-${pkgver}-beta.${pkgrel}-linux-X64.tar.gz"
        "e-search.sh")
sha256sums=('21dbcf771d66c1d559257ce8a74e340a3944eb87cf20b26effa40303333fbd0b'
            '44e82260c571f1e7b6daa9d88240d8212365b71089bda05fab11858973f0ba83')

package() {
    export LC_ALL=C.UTF-8
    install -Dm755 "e-search.sh" "${pkgdir}/usr/bin/e-search"
    install -dm755 "${pkgdir}/usr/lib/"
    install -dm755 "${pkgdir}/usr/share/applications"
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
    cd "$(find . -type d -iname "${_pkgname}-${pkgver}-beta.${pkgrel}-linux-x64")"
    ln -s "/usr/lib/esearch/assets/e-search.desktop" "${pkgdir}/usr/share/applications/"
    cp --no-preserve=mode,ownership "./resources/app/assets/icon.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/e-search.svg"
    cp -r --no-preserve=ownership "./resources/app" "${pkgdir}/usr/lib/esearch"
}
