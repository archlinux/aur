# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=p3x-onenote-bin
pkgver=2023.10.222
pkgrel=1
pkgdesc="Linux Electron Onenote - A Linux compatible version of OneNote"
arch=("aarch64" "armv7h" "x86_64")
url="https://www.corifeus.com/onenote/"
_githuburl="https://github.com/patrikx3/onenote"
license=('MIT')
depends=('hicolor-icon-theme' 'bash' 'electron24')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_arm64.deb")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_armv7l.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb")
source=("LICENSE::https://raw.githubusercontent.com/patrikx3/onenote/master/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('5f20849a5eb2ab79c731323683ad899ff95c82bb04b316f3e11eefcc126b0237'
            '1a80871d5b9ccd1b5521eb1e62687f32c6002c37ae172d357bf4938bb4711576')
sha256sums_aarch64=('d187439e5ec187457c5ecdf73d1c299dc556a35a4e2349df57c69b1eff39afe1')
sha256sums_armv7h=('541f0d0de2a6b0d5a41b41d3762996bbdabd8d610a515b213e4849b23ec0c143')
sha256sums_x86_64=('95458847aad2c81c7ea6843e3248df877cf02e33ed4a56f22ffca35bd3dd2775')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/P3X-OneNote/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    sed "s|/opt/P3X-OneNote/${pkgname%-bin} %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 128x128 256x256;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}