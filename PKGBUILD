# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=salesforce2sql-bin
pkgver=0.9.0
pkgrel=4
pkgdesc="Electron app to convert a Salesforce org's schema into a similarly shaped database."
arch=('x86_64')
url="https://github.com/acrosman/Salesforce2Sql"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'electron22'
    'libxcomposite'
    'libx11'
    'libxdamage'
    'mesa'
    'gtk3'
    'dbus-glib'
    'expat'
    'nss'
    'libxrandr'
    'libxext'
    'at-spi2-core'
    'libxkbcommon'
    'pango'
    'cairo'
    'libcups'
    'libxcb'
    'nspr'
    'libdrm'
    'alsa-lib'
    'libxfixes'
    'python'
    'make'
    'python-setuptools'
)
makedepends=(
    'npm'
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-1.${CARCH}.rpm"
    "${pkgname%-bin}.sh"
)
sha256sums=('54691aea18d09b8681fba38a568960673cea0011a1c1cfc3a378a72cb3babcd4'
            'af6cd72ad67a27e4373e2b43a102cc1d58129af05baae3ab9981b28527d4cc9e')
build() {
    cd "${srcdir}/usr/lib/${pkgname%-bin}/resources"
    npm add electron-debug
    sed "s|%U||g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/usr/lib/${pkgname%-bin}/resources/app" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/lib/${pkgname%-bin}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}