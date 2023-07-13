# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="fvc-bin"
pkgver=2.3.2
pkgrel=2
pkgdesc="File Version Control (FVC) is a tool designed to give automated version control abilities (similar to Git) to those working with binary and media files, where traditional version control is not possible. "
arch=('x86_64')
url="https://github.com/PrismLabsDev/fvc-desktop-electron"
license=('custom')
conflicts=("${pkgname%-bin}")
depends=('electron12' 'bash')
source=("${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb.zip"
    "${pkgname%-bin}.sh")
sha256sums=('f79bbc33c6e8d8ffa92d903a9c401d15cdabd9128f237249dd8d2275abb54368'
            'add4a4af6cd09bc4ae4a7ee53112a82ee445b2e5b362fa0c019adef9e6765d14')
  
package() {
    bsdtar -xf "${srcdir}/${pkgname%-bin}_${pkgver}_amd64.deb"
    bsdtar -xf "${srcdir}/data.tar.xz"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    sed "s| %U||g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}