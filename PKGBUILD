# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=keyopen-bin
_pkgname="Key Open"
pkgver=1.1.0
pkgrel=1
pkgdesc="A tool to open file or application quickly"
arch=("x86_64")
url="https://github.com/iewnfod/keyopen"
license=('MPL-2.0')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
)
sha256sums=('06f8172cba94afffa500dcde27cf7e2b38d6dd861cf067cb84938d42e3d96cd8')
build() {
    bsdtar -xf "${srcdir}/data."*
    sed "s|Name=${pkgname%-bin}|Name=${_pkgname}|g;s|Categories=|Categories=Utility;|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/5330x5330/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}