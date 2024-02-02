# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=hoptodesk-bin
pkgver=1.41.5
#https://www.hoptodesk.com/changelog
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
sha256sums=('256a7bc6ba5519d9aefc048c90dbab30b6787526503b7abac551f2066334c9ae')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/usr/share/icons/hicolor/128x128/${pkgname%-bin}.png|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/usr/lib/libsciter-gtk.so" -t "${pkgdir}/usr/lib"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/128x128/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/${pkgname%-bin}/files/systemd/${pkgname%-bin}.service" -t "${pkgdir}/usr/lib/systemd/system"
}