# Maintainer: Klaus Alexander Seiﬆrup <klaus at seistrup dot dk>
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: zhangkaizhao <zhangkaizhao at gmail dot com>
pkgname=dooble-bin
_pkgname=Dooble
pkgver=2025.11.25
pkgrel=1
pkgdesc="Web browser based on QtWebEngine.(Prebuilt version)"
arch=(
    #'aarch64'
    'x86_64'
)
url="https://textbrowser.github.io/dooble"
_ghurl="https://github.com/textbrowser/dooble"
license=('LicenseRef-Dooble')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'at-spi2-core'
    'cairo'
    'freetype2'
    'gdk-pixbuf2'
    'gtk3'
    'libcups'
    'libdrm'
    'libglvnd'
    'libx11'
    'libxcb'
    'libxext'
    'libxkbcommon'
    'libxkbcommon-x11'
    'libxrandr'
    'pango'
    'postgresql-libs'
    'qt6-base'
    'qt6-charts'
    'qt6-declarative'
    'qt6-multimedia'
    'qt6-positioning'
    'qt6-serialport'
    'qt6-svg'
    'qt6-tools'
    'qt6-wayland'
    'qt6-webchannel'
    'qt6-webengine'
    'unixodbc'
    'wayland'
    'xcb-util-cursor'
    'xcb-util-image'
    'xcb-util-keysyms'
    'xcb-util-renderutil'
    'xcb-util-wm'
    'libxshmfence'
    'nspr'
    'alsa-lib'
    'krb5'
    'libxtst'
    'libxcomposite'
    'libxfixes'
    'expat'
    'libxrender'
    'libxdamage'
    'fontconfig'
    'libxi'
    'libxkbfile'
    'nss'
)
optdepends=(
    'bzip2: needed in plugins/multimedia/libffmpegmediaplugin.so'
)
makedepends=(
    'findutils'
)
source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/textbrowser/dooble/${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
#source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_ghurl}/releases/download/${pkgver}/${_pkgname}-${pkgver}_arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_ghurl}/releases/download/${pkgver}/${_pkgname}-${pkgver}_amd64.deb")
sha256sums=('c60bf2d6a8bfdf7c7418bba91c6767cbb4b48dccae36dd5d9ffdb48f756815dd'
            '062f45de85a166d6ad01bf85eb58916b420c52ac122c55e7ed8668defb11c030')
sha256sums_x86_64=('15556a7a3b5a326ead958061fe60038f06c652f4d76b030c6426f61a8668daeb')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${_pkgname}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -i "s/\/usr\/bin\///g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${pkgname%-bin}" "${pkgdir}/usr/lib"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}
