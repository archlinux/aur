# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=page-builder-bin
pkgver=0.1.1
pkgrel=3
pkgdesc="An open source drag and drop Page Builder Made with Tauri"
arch=('x86_64')
url="https://github.com/abkarim/page-builder"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'webkit2gtk'
    'cairo'
    'libsoup'
    'hicolor-icon-theme'
    'pango'
    'gtk3'
    'gdk-pixbuf2'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/abkarim/page-builder/v${pkgver}/LICENSE"
)
sha256sums=('c8cc3938067f5a49a05723e814c42b6ac829b3e4c922f7dc8b40199552eb3f77'
            '9bf10a92024cbe4c09a8803c627a85a00aa1d162c2f5f2bc9439b96c7cf678d9')
build() {
    bsdtar -xf "${srcdir}/data.tar.gz"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    cp -r "${srcdir}/usr/lib" "${pkgdir}/usr"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 32x32 128x128 512x512@2;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}