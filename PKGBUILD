# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Thomas Quillan <tjquillan@gmail.com>
pkgname=kalidoface-bin
_pkgname=Kalidoface
pkgver=0.1.0
pkgrel=5
pkgdesc="A Vtuber web app powered by the latest and great in motion capture tech from MediaPipe."
arch=('x86_64')
url="https://lab.kalidoface.com/"
_ghurl="https://github.com/yeemachine/kalidoface"
license=('Apache')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'libcups'
    'nss'
    'cairo'
    'nodejs'
    'expat'
    'libxkbcommon'
    'libdrm'
    'libxfixes'
    'libxcb'
    'pango'
    'libxcomposite'
    'at-spi2-core'
    'dbus'
    'alsa-lib'
    'nspr'
    'gtk3'
    'libx11'
    'hicolor-icon-theme'
    'libxrandr'
    'libxext'
    'libxdamage'
    'mesa'
)
source=("${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb")
sha256sums=('effd121646ac6fdcbf65a18c08ac621f42bd59d2719003b53524fd67a941310e')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/opt/${_pkgname}/${pkgname%-bin}|${pkgname%-bin} --no-sandbox|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-bin}",usr/bin}
    cp -r "${srcdir}/opt/${_pkgname}/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
}