# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=blix-bin
_pkgname=Blix
pkgver=1.3.0
pkgrel=2
pkgdesc="A cross-platform AI-assisted graph photo editor."
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/COS301-SE-2023/AI-Photo-Editor"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
options=('!strip')
depends=(
    'libxext'
    'nss'
    'libxfixes'
    'libxcb'
    'pango'
    'libcups'
    'cairo'
    'mesa'
    'alsa-lib'
    'libx11'
    'libxdamage'
    'gtk3'
    'libxcomposite'
    'libdrm'
    'at-spi2-core'
    'expat'
    'libxrandr'
    'libxkbcommon'
    'nspr'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb")
sha256sums_aarch64=('d1444cb7ed34ead088218271eebb6b02868a3a881fb400a14e21fe22b33f6f43')
sha256sums_x86_64=('cc3356aede7d58bfcc2758d700f6bd836181bc87566491b573f4bb4f031bab4f')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/opt/${_pkgname}/${pkgname%-bin}|${pkgname%-bin} --no-sandbox|g;s|productivity|Graphics|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-bin}",usr/bin}
    cp -r "${srcdir}/opt/${_pkgname}/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}