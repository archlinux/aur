# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Siavash Askari Nasr <ciavash@protonmail.com>
pkgname=kaiteki-bin
_pkgname=Kaiteki
pkgver=2024_02
pkgrel=5
pkgdesc="A comfy Fediverse client for microblogging instances, made with Flutter and Dart. Currently with simple Mastodon, Pleroma, Misskey and Calckey support"
arch=('x86_64')
url='https://kaiteki.app'
_ghurl=https://github.com/Kaiteki-Fedi/Kaiteki
license=('AGPL-3.0-only')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    'gtk3'
    'libhandy'
)
source=(
    "${pkgname%-bin}-${pkgver}.zip::${_ghurl}/releases/download/weekly-${pkgver//_/-}/linux.zip"
    "${pkgname%-bin}.desktop"
    "${pkgname%-bin}.sh"
)
sha256sums=('1d58a8439b0f535ae9b37ffd460bdd391c38f9c74a80d361cd215301c9879b49'
            '6ce0f33c4d6d79fc24067f3ce6bf5ff29bce7515a442fb52476ebfc739ea5733'
            '3b8311438e88f47eb507322a43c7a4156bfebb8c0f6e7b7436ef70842fb4c745')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${pkgname%-bin}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 "${srcdir}/linux/${pkgname%-bin}" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/linux/"{data,lib} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/linux/data/flutter_assets/assets/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}