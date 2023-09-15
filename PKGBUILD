# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=nxshell-bin
_pkgname=NxShell
pkgver=1.9.6
pkgrel=1
pkgdesc="An easy to use new terminal."
arch=('x86_64')
url="https://nxshell.github.io/"
_githuburl="https://github.com/nxshell/nxshell"
_downurl="http://106.15.238.81:52081/github"
license=('MIT')
options=()
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('at-spi2-core' 'alsa-lib' 'gtk3' 'nss' 'python' 'gdk-pixbuf2' 'dbus' 'expat' 'libcups' 'libxcomposite' 'libx11' 'cairo' 'libxdamage' \
    'glibc' 'gcc-libs' 'pango' 'mesa' 'libxcb' 'nspr' 'libxrandr' 'libdrm' 'libxfixes' 'libxkbcommon' 'glib2' 'libxext' 'sh')
source=("${pkgname%-bin}-${pkgver}.deb::${_downurl}/${_pkgname}-amd64-linux-${pkgver}-202306300440.deb"
    "LICENSE::https://raw.githubusercontent.com/nxshell/nxshell/main/LICENSE")
sha256sums=('85ce9e3f019f655b929825826dc3b85703bda77acae45169a2c8cf53e5cded52'
            '5f6da76746b239458fc480805f2e761e4d95b023169b99bb2c333e5bbc125fb7')
prepare() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/opt/${_pkgname}/${pkgname%-bin}|${pkgname%-bin} --no-sandbox|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-bin}",usr/bin}
    cp -r "${srcdir}/opt/${_pkgname}/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/512x512/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}