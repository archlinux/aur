# Maintainer: DenXV <aur@denxv.me>

_pkgname="hyprism"
pkgname="hyprism-bin"
pkgver="2.0.3"
pkgrel="2"
pkgdesc="A multiplatform Hytale launcher with mod manager and more! (binary version)"
arch=("x86_64")
url="https://github.com/HyPrismTeam/HyPrism"
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
    "${_pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/HyPrism-linux-x64.deb"
    "${_pkgname}.desktop"
    "${_pkgname}.png"
    "LICENSE"
)
sha256sums=(
    "33aeca22eb3b74f8d59157c5bb732a275ad424831278885944d84606f1a20662"
    "89837ddd1c7dba01d6ac9e22b686fd7311986f2a49c1cd98c82fe72060dda679"
    "9fce08649bf1f267eccc113dcb36665ac64b7fbea100763e84fd174b71ede949"
    "acd0c57892db5a0f25a44bd29a10bedc61c2a12508af24e1a8037a1df7aeb710"
)

prepare() {
    bsdtar -xf "${srcdir}/data.tar.gz"
}

package() {
    install -d "${pkgdir}/opt/${pkgname}"
    cp -dr --no-preserve=ownership "${srcdir}/opt/hyprism/." "${pkgdir}/opt/${pkgname}/"
    chmod +x "${pkgdir}/opt/${pkgname}/HyPrism"

    install -d "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/HyPrism" "${pkgdir}/usr/bin/${_pkgname}"

    install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
