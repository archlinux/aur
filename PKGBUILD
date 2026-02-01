# Maintainer: DenXV <aur@denxv.me>

_pkgname="hyprism"
pkgname="hyprism-bin"
pkgver="2.0.3"
pkgrel="1"
pkgdesc="A multiplatform Hytale launcher with mod manager (binary version)"
arch=("x86_64")
url="https://github.com/yyyumeniku/HyPrism"
license=("MIT")

provides=("hyprism")
conflicts=(
    "hyprism"
    "hyprism-git"
)
depends=(
    "gst-plugins-good"
    "gtk3"
    "libnotify"
    "webkit2gtk-4.1"
)
options=("!strip")

source=(
    "${url}/releases/download/v${pkgver}/HyPrism-linux-x64.deb"
    "${_pkgname}.desktop"
    "${_pkgname}.png"
    "LICENSE"
)
sha256sums=(
    "33aeca22eb3b74f8d59157c5bb732a275ad424831278885944d84606f1a20662"
    "5a8927e9d5b21d6d78bdb84ab5afdeb8f06371018a713147e71de1217756f880"
    "9fce08649bf1f267eccc113dcb36665ac64b7fbea100763e84fd174b71ede949"
    "acd0c57892db5a0f25a44bd29a10bedc61c2a12508af24e1a8037a1df7aeb710"
)

prepare() {
    tar -xf data.tar.gz
}

package() {
    install -d "${pkgdir}/opt/${_pkgname}"
    cp -dr --no-preserve=ownership "opt/hyprism/." "${pkgdir}/opt/${_pkgname}/"
    chmod +x "${pkgdir}/opt/${_pkgname}/HyPrism"

    install -d "${pkgdir}/usr/bin"
    ln -s "/opt/${_pkgname}/HyPrism" "${pkgdir}/usr/bin/${_pkgname}"

    install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
