# Maintainer: Evine Deng <evinedeng@hotmail.com>

_pkgname="tinyMediaManager"
pkgname="${_pkgname,,}-bin"
pkgver=5.0.2
pkgrel=1
pkgdesc="A media management tool written in Java/Swing."
provides=("${_pkgname,,}")
conflicts=("${_pkgname,,}")
arch=("x86_64" "aarch64")
url="https://www.${_pkgname,,}.org"
license=("apache")
depends=(
    "alsa-lib"
    "glibc"
    "libmediainfo"
    "libx11"
    "libxau"
    "libxcb"
    "libxdmcp"
    "libxext"
    "libxi"
    "libxrender"
    "libxtst"
    "zlib"
)
source=("${_pkgname,,}.desktop"
        "${_pkgname,,}.png")
source_x86_64=("https://release.${_pkgname,,}.org/v5/dist/${_pkgname}-${pkgver}-linux-amd64.tar.xz")
source_aarch64=("https://release.${_pkgname,,}.org/v5/dist/${_pkgname}-${pkgver}-linux-arm64.tar.xz")
sha256sums=('08499a10730b6af6113c4a56e4ed7bed068d7fed282080dfd550b66d6a8ac9f5'
            '79b50c260b1c1c1f695c0ea1d743742d11d9a1337a2bc73985e4428752492f0f')
sha256sums_x86_64=('a910d7a090063c7b763320d262b0233add57c248b660c842f7d947a5542bfd07')
sha256sums_aarch64=('68332232f2771e518a8f89758801228f9a956125edf5495585d225d459ef527d')
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
