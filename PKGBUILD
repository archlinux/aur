# Maintainer: devome <evinedeng@hotmail.com>

_pkgname="tinyMediaManager"
pkgname="${_pkgname,,}-bin"
pkgver=5.0.4
pkgrel=1
pkgdesc="A media management tool written in Java/Swing."
provides=("${_pkgname,,}")
conflicts=("${_pkgname,,}")
arch=("x86_64" "aarch64")
url="https://www.${_pkgname,,}.org"
license=("Apache-2.0")
depends=("ffmpeg" "java-runtime>=21" "libmediainfo")
source=("${_pkgname,,}.desktop"
        "${_pkgname,,}.png")
source_x86_64=("https://release.${_pkgname,,}.org/v5/dist/${_pkgname}-${pkgver}-linux-amd64.tar.xz")
source_aarch64=("https://release.${_pkgname,,}.org/v5/dist/${_pkgname}-${pkgver}-linux-arm64.tar.xz")
sha256sums=('08499a10730b6af6113c4a56e4ed7bed068d7fed282080dfd550b66d6a8ac9f5'
            '79b50c260b1c1c1f695c0ea1d743742d11d9a1337a2bc73985e4428752492f0f')
sha256sums_x86_64=('3c3c2d12ce44076a499bb49c5d35c8d0839fa45caf0e031f6e0bc720a8072b3d')
sha256sums_aarch64=('c9d32eab91f6b72535c7182cac3af22b8c928d98293636820e365fc9e8ab6ba3')

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
