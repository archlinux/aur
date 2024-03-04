# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=anklang-bin
pkgver=0.2.0
_electronversion=25
pkgrel=4
pkgdesc="A digital audio synthesis application for live creation and composition of music and other audio material."
arch=('x86_64')
url="https://github.com/tim-janik/anklang"
license=("MPL-2.0")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk2'
    'gtk3'
    'alsa-lib'
    'hicolor-icon-theme'
    'nss'
    'flac'
    'pipewire-jack'
    'opus'
)
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb")
sha256sums=('749f5a76b3bde9fdf3f6ea87cca936f2ab2572ac00e31e3d3a47e63f66c0e099')
build() {
    bsdtar -xf "${srcdir}/data."*
    sed "s|Exec=/usr/local/lib/${pkgname%-bin}-0-2/bin/${pkgname%-bin}|Exec=${pkgname%-bin}|g" \
        -i "${srcdir}/usr/local/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-bin}",usr/bin}
    cp -r "${srcdir}/usr/local/lib/${pkgname%-bin}-0-2/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/bin/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/local/share/doc/${pkgname%-bin}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/usr/local/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/local/share/icons/hicolor/scalable/apps/${pkgname%-bin}.svg" -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
    install -Dm644 "${srcdir}/usr/local/share/man/man1/${pkgname%-bin}.1" -t "${pkgdir}/usr/share/man/man1"
    install -Dm644 "${srcdir}/usr/local/share/mime/packages/${pkgname%-bin}.xml" -t "${pkgdir}/usr/share/mime/packages"
    install -Dm644 "${srcdir}/usr/local/share/doc/${pkgname%-bin}/"*.* -t "${pkgdir}/usr/share/doc/${pkgname%-bin}"
    cp -r "${srcdir}/usr/local/share/doc/${pkgname%-bin}/style" "${pkgdir}/usr/share/doc/${pkgname%-bin}"
    ln -sf "/usr/lib/libFLAC.so" "${pkgdir}/opt/${pkgname%-bin}/lib/libFLAC.so.8"
}