# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=chrolog-bin
pkgver=1.5.0
pkgrel=3
pkgdesc="A automated time tracking tool"
arch=("x86_64")
url="https://github.com/Lukylix/Chrolog"
license=('custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('hicolor-icon-theme' 'electron23' 'python' 'libinput' 'perl' 'bash' 'zlib' 'glibc' 'expat' 'systemd-libs' 'gcc-libs')
source=("${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux.zip"
    "${pkgname%-bin}.sh")
sha256sums=('4ba773a11f93fe66357605f403517e0326aa67201cd25a7fbe1a0919236e21f6'
            '70ba9838543f4043317387cfb7adda8f21cbbc4d56814028c874bcfbd88d4a71')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    cp -r "${srcdir}/linux-unpacked/resources/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/linux-unpacked/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/linux-unpacked/resources/resources/icon.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname%-bin}.svg"
    gendesk -f -n --icon "${pkgname%-bin}" --categories "Utility" --name "Chrolog" --exec "/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}