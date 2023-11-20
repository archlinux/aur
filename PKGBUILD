# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Siavash Askari Nasr <ciavash@protonmail.com>
pkgname=kaiteki-bin
_pkgname=Kaiteki
pkgver=2023_47
pkgrel=1
pkgdesc="A comfy Fediverse client for microblogging instances, made with Flutter and Dart. Currently with simple Mastodon, Pleroma, Misskey and Calckey support"
arch=('x86_64')
url='https://kaiteki.app'
_ghurl=https://github.com/Kaiteki-Fedi/Kaiteki
license=('AGPL3')
provides=("${_pkgname}")
depends=(
    'gtk3'
    'libhandy'
    'at-spi2-core'
    'cairo'
    'libepoxy'
    'pango'
    'gdk-pixbuf2'
    'fontconfig'
)
makedepends=(
    'gendesk'
)
source=(
    "${pkgname%-bin}-${pkgver}.zip::${_ghurl}/releases/download/weekly-${pkgver//_/-}/linux.zip"
    "${pkgname%-bin}.png::https://raw.githubusercontent.com/Kaiteki-Fedi/Kaiteki/weekly-${pkgver//_/-}/src/kaiteki/assets/icon.png"
)
sha256sums=('3e97f8c7231e4e6af52db8aab9a6f10308ce9a501add318f347e92c5b2f6d97f'
            'dc6b22558692d50f71113dbcbfed6382892cc2a27444cdacde03099297f36e3e')
build() {
    gendesk -q -f -n --categories "Network" --name="${_pkgname}" --exec="${pkgname%-bin} --no-sandbox %U"
    chmod 755 "${srcdir}/linux/${pkgname%-bin}"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-bin}",usr/bin}
    cp -r "${srcdir}/linux/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
}