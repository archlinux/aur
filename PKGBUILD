# Maintainer: prettyleaf
# Maintainer: pluralplay

pkgname=flclashx-git
_pkgname=FlClashX
pkgver=0.3.0
pkgrel=13
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
sha256sums_aarch64=('8124a2ab95b7a13c9c3f58da9fa0ece52e9ea27a0a0c2f4337881c4697e6f36c')
sha256sums_x86_64=('4541c398c859180da0f68f78d9390e0208466825222df33c8cf85934701ed75b')
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
