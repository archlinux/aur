# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=hoptodesk-bin
pkgver=1.40.7
#https://www.hoptodesk.com/changelog
pkgrel=1
pkgdesc="A free remote desktop tool that allows users to share their screens and remotely control access to their computers and devices."
arch=('x86_64')
url="https://www.hoptodesk.com"
_gitlaburl="https://gitlab.com/hoptodesk/hoptodesk"
license=('GPL3')
conflits=("${pkgname%-bin}")
depends=('libxfixes' 'pango' 'gcc-libs' 'gtk3' 'gdk-pixbuf2' 'libx11' 'util-linux-libs' 'glib2' 'libxtst' \
    'cairo' 'libxkbcommon' 'gst-plugins-base-libs' 'gstreamer' 'libxcb' 'libpulse' 'dbus' 'xdotool' 'glibc')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/hoptodesk.deb"
    "LICENSE::${_gitlaburl}/-/raw/main/LICENSE?inline=false")
sha256sums=('394e93e365b755ed44f8ff6837bbc2e8d76c315132f74076cf1e988bcb2bdb0b'
            '8486a10c4393cee1c25392769ddd3b2d6c242d6ec7928e1414efff7dfb2f07ef')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/bin"
    ln -s "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/lib/libsciter-gtk.so" -t "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/128x128/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    sed "s|/usr/share/icons/hicolor/128x128/${pkgname%-bin}.png|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}