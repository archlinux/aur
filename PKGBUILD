# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=dooble-bin
_pkgname=dooble
pkgver=2023.02.20
pkgrel=1
pkgdesc="Web browser based on QtWebEngine"
arch=(x86_64)
url="https://textbrowser.github.io/dooble/"
license=('BSD')
depends=(
    'unixodbc'
    'at-spi2-core'
    'gtk3'
    'qt6-webengine'
    'qt6-svg'
)
optdepends=()
conflicts=('dooble')
source=(
    "${_pkgname}-${pkgver}.tar.gz::https://github.com/textbrowser/${_pkgname}/releases/download/${pkgver}/Dooble-${pkgver}.tar.gz"
    "${_pkgname}.desktop"
    "LICENSE::https://github.com/textbrowser/dooble/raw/master/LICENSE"
    )
sha256sums=('f0efbb0b2137669338bf232b4ec881cef7478c445b2e797ed45f4206d7971f7b'
            '0451898ad6b3864601d4406956558153b9518b1695545440e91bf26465c1dbe4'
            'c60bf2d6a8bfdf7c7418bba91c6767cbb4b48dccae36dd5d9ffdb48f756815dd')

prepare() {
    mkdir -p "${pkgdir}/opt/${_pkgname}"
}

package() {
    mkdir -p "${pkgdir}/opt/${_pkgname}/"
    #Use system libc.so.6
    rm -r "${srcdir}/${_pkgname}/Lib/libc.so.6"
    cp -r "${srcdir}/${_pkgname}/" "${pkgdir}/opt/"
    install -Dm755 "${srcdir}/${_pkgname}/Dooble" "${pkgdir}/opt/${_pkgname}/Dooble"
    install -Dm644 "${srcdir}/${_pkgname}/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.png"
    install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
