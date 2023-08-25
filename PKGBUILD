# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=rao-pics-bin
_appname="Rao Pics"
_pkgname="@acmeelectron"
pkgver=0.7.16
pkgrel=1
pkgdesc="RaoPics help you visit material on any devices, base on Eagle/Billfish/Pixcall and other photos material management apps."
arch=('aarch64' 'x86_64')
url="https://rao.pics/"
_githuburl="https://github.com/rao-pics/rao-pics"
license=('AGPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('hicolor-icon-theme' 'bash' 'electron20')
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_githuburl}/releases/download/v${pkgver}/Rao.Pics-${pkgver}-linux-arm64-openssl-1.1.x.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_githuburl}/releases/download/v${pkgver}/Rao.Pics-${pkgver}-linux-amd64-openssl-1.1.x.deb")
source=("${pkgname%-bin}.sh")
sha256sums=('0d1b0c3b84190fe4f60b5390caf0d292f2a0c4362a2bf02107b30d6be92bfd4b')
sha256sums_aarch64=('6e2bd0fdf5133ecd11c66dc069c75955f7e37ae6cfb8fc06a37e0f32913c9d29')
sha256sums_x86_64=('7b53f1988cdf792b4f46c1f6e52fb28adccd0b95b47058a191f393feeb475c41')
prepare() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|\"/opt/${_appname}/${_pkgname}\" %U|/${pkgname%-bin}|g;s|${_pkgname}|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${_appname}/resources/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    for _icons in 16x16 32x32 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}"
    done
}