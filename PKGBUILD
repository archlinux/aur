# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=jan-electron-bin
_pkgname=Jan
pkgver=0.1.3
pkgrel=1
pkgdesc="Run AI on your own PC"
arch=("x86_64")
url="https://jan.ai/"
_githuburl="https://github.com/janhq/jan"
license=('custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('alsa-lib' 'at-spi2-core' 'libxext' 'libxdamage' 'mesa' 'gtk3' 'libcups' 'pango' 'libxkbcommon' 'glibc' 'nspr' \
    'libxcomposite' 'libx11' 'libxcb' 'libxfixes' 'gcc-libs' 'glib2' 'expat' 'cairo' 'dbus' 'nss' 'libxrandr' 'libdrm')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}-linux-amd64-${pkgver}.deb"
    "LICENSE::https://raw.githubusercontent.com/janhq/jan/v${pkgver}/LICENSE")
sha256sums=('48cdfd9c501b7a0a25fa9ed8deb85f3535c993262321573a385eddacd25f63d7'
            'f6e40124cdadf9cbab0a7681923af8384b7b5510ed345985d92cb30f2b11c528')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/opt/${_pkgname}/${pkgname%-bin}|${pkgname%-bin} --no-sandbox|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-bin}",usr/bin}
    cp -r "${srcdir}/opt/${_pkgname}/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}