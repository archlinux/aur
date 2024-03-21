# Maintainer: Evine Deng <evinedeng@hotmail.com>

_pkgname="tinyMediaManager"
pkgname="${_pkgname,,}-bin"
pkgver=5.0.3
pkgrel=2
pkgdesc="A media management tool written in Java/Swing."
provides=("${_pkgname,,}")
conflicts=("${_pkgname,,}")
arch=("x86_64" "aarch64")
url="https://www.${_pkgname,,}.org"
license=("apache")
depends=("ffmpeg" "java-runtime>=21" "libmediainfo")
source=("${_pkgname,,}.desktop"
        "${_pkgname,,}.png")
source_x86_64=("https://release.${_pkgname,,}.org/v5/dist/${_pkgname}-${pkgver}-linux-amd64.tar.xz")
source_aarch64=("https://release.${_pkgname,,}.org/v5/dist/${_pkgname}-${pkgver}-linux-arm64.tar.xz")
sha256sums=('08499a10730b6af6113c4a56e4ed7bed068d7fed282080dfd550b66d6a8ac9f5'
            '79b50c260b1c1c1f695c0ea1d743742d11d9a1337a2bc73985e4428752492f0f')
sha256sums_x86_64=('87a436839ac2ac4d4b465a980566dc359f1a773318d93935dcf3b6c98053f12b')
sha256sums_aarch64=('83a453a454ab804dc23e8f502efe468f2103725dba030002f6a23f3db91e3b7f')

prepare() {
    cd "${_pkgname}"
    mv LICENSE ..
    rm -rf jre native/linux/addons/*
}

package() {
    install -Dm644 "LICENSE"               "${pkgdir}/usr/share/licenses/${_pkgname,,}/LICENSE"
    install -Dm644 "${_pkgname,,}.desktop" "${pkgdir}/usr/share/applications/${_pkgname,,}.desktop"
    install -Dm644 "${_pkgname,,}.png"     "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname,,}.png"
    install -dm755 "${pkgdir}/"{opt,usr/bin}
    cp --preserve=mode -r "${_pkgname}" "${pkgdir}/opt/${_pkgname,,}"
    ln -s "/opt/${_pkgname,,}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname,,}"
    ln -s /usr/lib/jvm/default "${pkgdir}/opt/${_pkgname,,}/jre"
    ln -s /usr/bin/ffmpeg "${pkgdir}/opt/${_pkgname,,}/native/linux/addons/ffmpeg"
}
