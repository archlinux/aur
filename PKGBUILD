# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=rao-pics-bin
_appname="Rao Pics"
_pkgname="@acmeelectron"
pkgver=0.7.10
pkgrel=2
pkgdesc="RaoPics help you visit material on any devices, base on Eagle/Billfish/Pixcall and other photos material management apps."
arch=('aarch64' 'x86_64')
url="https://rao.pics/"
_githuburl="https://github.com/rao-pics/rao-pics"
license=('AGPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('hicolor-icon-theme' 'bash' 'electron20')
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_githuburl}/releases/download/v${pkgver}-2/Rao.Pics-${pkgver}-linux-arm64-openssl-1.1.x.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_githuburl}/releases/download/v${pkgver}-2/Rao.Pics-${pkgver}-linux-amd64-openssl-1.1.x.deb")
source=("${pkgname%-bin}.sh")
sha256sums=('0d1b0c3b84190fe4f60b5390caf0d292f2a0c4362a2bf02107b30d6be92bfd4b')
sha256sums_aarch64=('47a832a08350483f4a6190bb96fd80e310295f1d926ef60ddbe6f5c734f592d2')
sha256sums_x86_64=('cfbcd4c27e2765a01f3d2ec1870fe2bdfbfab70d9dc0ac0459b59e6175fad831')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${_appname}/resources/"* "${pkgdir}/opt/${pkgname%-bin}"
    sed "s|/${_appname}|/${pkgname%-bin}|g;s| %U||g;s|${_pkgname}|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    for _icons in 16x16 32x32 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}"
    done
}