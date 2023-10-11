# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=string-file-manager-bin
pkgver=1.0.2
pkgrel=1
pkgdesc="File manager for Linux - Built with Electron"
arch=('x86_64')
url="https://github.com/Michael-Vanderford/electron-file-manager"
license=('GPL3')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=('bash' 'electron26' 'hicolor-icon-theme' 'baobab')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/${pkgname%-bin}-v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "${pkgname%-bin}.sh")
sha256sums=('594c7884e8ab306664fdc0ded52b08470e994fbf7ad3bf30b651a3bd32f1d91e'
            '1e3b5f01d081cf0cae9b37294f09c1c6ae89bd3ef40d51adbafe7a554aa67e66')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/opt/${pkgname%-bin}/${pkgname%-bin} %U|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/resources/"* -t "${pkgdir}/opt/${pkgname%-bin}/resources"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}