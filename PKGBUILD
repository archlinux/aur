# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=spx-translation-bin
pkgver=2.0.5
pkgrel=2
pkgdesc="聚合翻译程序(谷歌+deepl)"
arch=('x86_64')
url="https://github.com/mlmdflr/spx-translation"
license=('MIT')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    'gtk3'
    'alsa-lib'
    'nss'
    'nspr'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/vv${pkgver}-1/${pkgname%-bin}_${pkgver}_amd64.deb"
)
sha256sums=('533fe4d722f3b7edf6d295df6c8807be1960647c01e45c6cf95eeab7f8338376')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/opt/${pkgname%-bin}-linux/${pkgname%-bin}|${pkgname%-bin} --no-sandbox|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-bin}",usr/bin}
    cp -r "${srcdir}/opt/${pkgname%-bin}-linux/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/256x256/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}-linux/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}