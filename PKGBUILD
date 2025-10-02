# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_Name="SkyEmu"
_pkgname="${_Name,,}"
pkgname="${_pkgname}-bin"
pkgver=4
pkgrel=1
pkgdesc="Game Boy Advance, Game Boy, Game Boy Color, and DS Emulator"
arch=('x86_64')
url="https://github.com/skylersaleh/${_Name}"
license=('MIT')
depends=(
  'alsa-lib'
  'gcc-libs'
  'glibc'
  'hicolor-icon-theme'
  'libgl'
  'libx11'
  'libxcursor'
  'libxi'
)
makedepends=(
  'gendesk'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgsrc}-README.md::${url}/raw/refs/tags/v${pkgver}/README.md"
        "${_pkgsrc}-LICENSE::${url}/raw/refs/tags/v${pkgver}/LICENSE"
        "${_pkgsrc}.png::${url}/raw/refs/tags/v${pkgver}/src/resources/icons/icon.png"
        "${_pkgsrc}.svg::${url}/raw/refs/tags/v${pkgver}/src/resources/icons/icon.svg")
source_x86_64=("${_pkgsrc}-x86_64.zip::${url}/releases/download/v${pkgver}/${_Name}-v${pkgver}-Linux.zip")
sha256sums=('a4ccbf7a5a64fa59d7e8aa19d5e2891e3a2e7334c206414bb90fa09c9971fefe'
            '1f91405749a4baea5d57b812f4c995949c5008d77a6804d956be82c40b5c5e00'
            'cc26e3ccc043496f2a065bf53f1c2c342235402919abd828497ea840256bc057'
            'b978e3e512c77d20e6d698364ad2ccc1a6fd169f10d39b9ac4c7948efea71622')
sha256sums_x86_64=('a98c027c87cfee60fb76fb4a930596dd1f686a622ea44f7d3686ea7644c15f43')

build() {
  cd "${srcdir}"
  gendesk -f -n \
    --pkgname "${_pkgname}" \
    --pkgdesc "${pkgdesc}" \
    --name "${_Name}" \
    --exec "${_Name}" \
    --categories "Game;Emulator"
}

package() {
  cd "${srcdir}"
  install -vDm755 "${_Name}"             "${pkgdir}/usr/bin/${_Name}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -vDm644 "${_pkgsrc}.png"       "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
  install -vDm644 "${_pkgsrc}.svg"       "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg"
  install -vDm644 "${_pkgname}.desktop"  "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
