# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=dooble-bin
_pkgname=dooble
pkgver=2023.02.25
pkgrel=1
pkgdesc="Web browser based on QtWebEngine"
arch=(x86_64)
url="https://textbrowser.github.io/dooble/"
license=('BSD')
depends=('unixodbc' 'at-spi2-core' 'gtk3' 'qt6-webengine' 'qt6-svg')
optdepends=()
conflicts=('dooble')
source=(
    "${_pkgname}-${pkgver}.tar.gz::https://github.com/textbrowser/${_pkgname}/releases/download/${pkgver}/Dooble-${pkgver}.tar.gz"
    "${_pkgname}.desktop"
    "LICENSE::https://github.com/textbrowser/dooble/raw/master/LICENSE"
    )
sha256sums=('e15e464f2cd86b9c75e6ac3fd57910dd315350b4f5817a9839d7736ebcd37785'
            '0451898ad6b3864601d4406956558153b9518b1695545440e91bf26465c1dbe4'
            'cbf629abfdc78b888d87ceae0847a9129e5b0e1baa8da4a1cec53324f38defb7')
package() {
    mkdir -p "${pkgdir}/opt"
    bsdtar -xvf ${_pkgname}-${pkgver}.tar.gz -C "${pkgdir}/opt"
    find "${pkgdir}/opt" -type d -exec chmod 755 {} \;
    chown -R root:root "${pkgdir}/opt"
    chmod -x "${pkgdir}/opt/dooble/Lib/libQt6WebEngineCore.so.6"
    #Use system libc.so.6
    rm -r "${pkgdir}/opt/${_pkgname}/Lib/libc.so.6"
    install -Dm644 "${pkgdir}/opt/${_pkgname}/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.png"
    install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}