# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=todometer-bin
pkgver=2.0.1
pkgrel=2
pkgdesc="A simple, meter-based to-do list built with Electron and React."
arch=('x86_64')
url="https://cassidoo.github.io/todometer/"
_githuburl="https://github.com/cassidoo/todometer"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
depends=('libxcomposite' 'glibc' 'hicolor-icon-theme' 'at-spi2-core' 'libx11' 'util-linux-libs' 'libxrender' 'cairo' 'libxcb' 'expat' \
    'libxext' 'glib2' 'dbus' 'libcups' 'gtk3' 'nss' 'libxtst' 'libxrandr' 'alsa-lib' 'pango' 'libxfixes' 'nspr' 'libxi' 'libxdamage' \
    'libxcursor' 'libxss' 'gdk-pixbuf2' 'gcc-libs')
makedepends=('gendesk')
noextract=("${pkgname%-bin}-${pkgver}.zip")
source=("${pkgname%-bin}-${pkgver}.zip::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}.for.linux.zip"
    "LICENSE::https://raw.githubusercontent.com/cassidoo/todometer/v${pkgver}/LICENSE"
    "${pkgname%-bin}.svg::https://raw.githubusercontent.com/cassidoo/todometer/main/assets/logo.svg")
sha256sums=('87fa096049457bc9a63fb33c8040c15a668c81c8aab92be4efadc4a05dd50b20'
            '493e4a9d6f7124993ebc7ceaaa071da339b57ff8a76fa836f54b0977316c31d8'
            'a89aea8ce4dce004a824cba2d6d93f40a31fa876b4c0e8796cefa0bf6ff8a24c')
prepare() {
    bsdtar -xf "${srcdir}/${pkgname%-bin}-${pkgver}.zip" -C "${srcdir}"
    gendesk -f -n --categories "Utility" --name "${pkgname%-bin}" --exec "${pkgname%-bin}"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-bin}",usr/bin}
    cp -r "${srcdir}/linux-unpacked/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.svg" -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}