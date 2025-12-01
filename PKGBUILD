# Maintainer: prettyleaf
# Maintainer: pluralplay

pkgname=flclashx-git
_pkgname=FlClashX
pkgver=0.3.0
pkgrel=8
pkgdesc="[Pre-release] Fork of FlClash | A multi-platform proxy client based on ClashMeta, simple and easy to use, open-source and ad-free."
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/pluralplay/FlClashX"
license=('GPL-3.0')
conflicts=("${pkgname%-git}" "flclash-bin" "flclash" "flclashx" "flclashx-bin" "flclashx-bin-debug")
provides=("${pkgname%-git}=${pkgver}")
depends=(
    'libayatana-appindicator'
    'libkeybinder3'
)
options=('!strip' '!emptydirs')
source=("${pkgname%-git}.sh")
source_aarch64=("${pkgname%-git}-${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver}-pre.${pkgrel}/${_pkgname}-linux-arm64.deb")
source_x86_64=("${pkgname%-git}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}-pre.${pkgrel}/${_pkgname}-linux-amd64.deb")
sha256sums=('3b8311438e88f47eb507322a43c7a4156bfebb8c0f6e7b7436ef70842fb4c745')
sha256sums_aarch64=('f8b82b6fd0a67d85c650ca737e1f7ed3f528363c70e50945285c89ada532d63e')
sha256sums_x86_64=('f0b3a631090bfdbb781ee5890d4dc618ffd7de6c221471f08cda01d9f1d29b3d')
prepare() {
    sed -i -e "
      s/@appname@/${pkgname%-git}/g
      s/@runname@/${_pkgname}/g
    " "${srcdir}/${pkgname%-git}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -i -e "
      s/Exec=${_pkgname}/Exec=${pkgname%-git}/g
      s/Icon=${_pkgname}/Icon=${pkgname%-git}/g
      5i\Categories=Network;
    " "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-git}"
    cp -Pr --no-preserve=ownership "${srcdir}/usr/share/${_pkgname}/"* "${pkgdir}/usr/lib/${pkgname%-git}/"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-git}.desktop"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/128x128/apps/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${pkgname%-git}.png"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname%-git}.png"
}
