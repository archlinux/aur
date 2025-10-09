# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# https://www.hoptodesk.com/changelog
pkgname=hoptodesk-bin
pkgver=1.44.5
pkgrel=1
pkgdesc="A free remote desktop tool that allows users to share their screens and remotely control access to their computers and devices."
arch=('x86_64')
url="https://www.hoptodesk.com"
_gitlaburl="https://gitlab.com/hoptodesk/hoptodesk"
license=('GPL-3.0-only')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    'gtk3'
    'libpulse'
    'gst-plugins-base-libs'
    'gstreamer'
    'xdotool'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/${pkgname%-bin}.deb"
)
sha256sums=('06f8a7742e7925ab9731f0127e0401d22341b6d2a3aedf86a61118bbb6572dca')
prepare() {
    bsdtar -xf "${srcdir}/data."*
    sed -i "s/\/usr\/share\/icons\/hicolor\/128x128\/128x128.png/${pkgname%-bin}/" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/usr/lib/libsciter-gtk.so" -t "${pkgdir}/usr/lib"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/128x128/128x128.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/${pkgname%-bin}/files/systemd/${pkgname%-bin}.service" -t "${pkgdir}/usr/lib/systemd/system"
}
