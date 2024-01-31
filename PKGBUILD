# Maintainer: Evine Deng <evinedeng@hotmail.com>

_pkgname="tinyMediaManager"
pkgname="${_pkgname,,}-bin"
pkgver=5.0.1.1
pkgrel=2
pkgdesc="A media management tool written in Java/Swing."
provides=("${_pkgname,,}")
conflicts=("${_pkgname,,}")
arch=("x86_64" "aarch64")
url="https://www.${_pkgname,,}.org"
license=("apache")
depends=("libmediainfo")
source=("${_pkgname,,}.desktop"
        "${_pkgname,,}.png")
source_x86_64=("https://release.${_pkgname,,}.org/v5/dist/${_pkgname}-${pkgver}-linux-amd64.tar.xz")
source_aarch64=("https://release.${_pkgname,,}.org/v5/dist/${_pkgname}-${pkgver}-linux-arm64.tar.xz")
sha256sums=('08499a10730b6af6113c4a56e4ed7bed068d7fed282080dfd550b66d6a8ac9f5'
            '79b50c260b1c1c1f695c0ea1d743742d11d9a1337a2bc73985e4428752492f0f')
sha256sums_x86_64=('c131003639c1288f6af7fe4d277cb585a28299b06cf0939c57f791366d9bdc0c')
sha256sums_aarch64=('4849aa894aab0554089cce817d083d6bffc68c9a2877988314d674fcfcde5bfd')
options=(!strip)

package() {
    install -Dm644 "${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname,,}/LICENSE"
    rm "${_pkgname}/LICENSE"

    install -dm755 "${pkgdir}/opt"
    cp --preserve=mode -r "${_pkgname}" "${pkgdir}/opt/${_pkgname,,}"

    install -Dm644 "${_pkgname,,}.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname,,}.png"
    for res in 128x128 16x16 24x24 32x32 48x48 64x64 96x96; do
        install -dm755 "${pkgdir}/usr/share/icons/hicolor/${res}/apps"
        ln -s "/opt/${_pkgname,,}/tmm.png" "${pkgdir}/usr/share/icons/hicolor/${res}/apps/${_pkgname,,}.png"
    done

    install -Dm644 "${_pkgname,,}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${_pkgname,,}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname,,}"
}
