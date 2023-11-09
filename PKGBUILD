# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
pkgname=grinplusplus-bin
_pkgname=GrinPlusPlus
pkgver=1.2.8
pkgrel=4
pkgdesc='A C++ Grin Node & Wallet For Linux'
arch=('x86_64')
url="https://grinplusplus.github.io"
_ghurl="https://github.com/GrinPlusPlus/GrinPlusPlus"
license=('MIT')
provides=("${pkgname%-bin}-${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'libxdamage'
    'nss'
    'libx11'
    'openssl-1.1'
    'alsa-lib'
    'libevent'
    'cairo'
    'zlib'
    'dbus'
    'nspr'
    'pango'
    'libxext'
    'libxfixes'
    'expat'
    'libcups'
    'util-linux-libs'
    'gdk-pixbuf2'
    'libxcomposite'
    'libdrm'
    'libxkbcommon'
    'libxrandr'
    'at-spi2-core'
    'libxcb'
    'mesa'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${_pkgname}.${pkgver}.deb"
    "LICENSE::https://raw.githubusercontent.com/GrinPlusPlus/GrinPlusPlus/v${pkgver}/LICENSE"
)
sha256sums=('9d331477bec4bf78a54e0169ca862d5a269ca5e62ec27fc2897a0e6916d5621a'
            'a5e9383c3cb97aa3034e5e4bf1c94a71db0c59b3a7ec1fbf198232fb9dcc5e53')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|\"/opt/${_pkgname//Plus/+}/${pkgname%-bin}\" %U|${pkgname%-bin} --no-sandbox %U|g;s|Finance|Utility|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-bin}",usr/bin}
    cp -r "${srcdir}/opt/${_pkgname//Plus/+}/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/512x512/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}