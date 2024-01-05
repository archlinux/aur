# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=hoptodesk-bin
pkgver=1.41.4
#https://www.hoptodesk.com/changelog
pkgrel=1
pkgdesc="A free remote desktop tool that allows users to share their screens and remotely control access to their computers and devices."
arch=('x86_64')
url="https://www.hoptodesk.com"
_gitlaburl="https://gitlab.com/hoptodesk/hoptodesk"
license=('GPL3')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    'libxfixes'
    'pango'
    'gtk3'
    'gdk-pixbuf2'
    'libx11'
    'util-linux-libs'
    'libxtst'
    'cairo'
    'libxkbcommon'
    'gst-plugins-base-libs'
    'gstreamer'
    'libxcb'
    'libpulse'
    'xdotool'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/${pkgname%-bin}.deb"
)
sha256sums=('452664c1666cddd6fbb118341b45318ac5155481f8ce79c309f46a4b6a330e8e')
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