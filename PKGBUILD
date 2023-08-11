# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=git-good-bin
pkgver=0.1.4
pkgrel=3
pkgdesc="Just a simple git client using electron and nodegit, focus on lightweight and performance"
arch=("x86_64")
url="https://github.com/weedz/git-good"
license=('GPL3')
depends=('krb5' 'gcc-libs' 'e2fsprogs' 'bash' 'python' 'glibc' 'openssl')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.zst::${url}/releases/download/v${pkgver}/${pkgname%-bin}-v${pkgver}.r10.gba5f431-1-${CARCH}.pkg.tar.zst")
sha256sums=('ee6398e00e3cf73f87bd629ce2fd002e4987dfbaf4b3b7c4b55f0ff4046b32b2')
package() {
    install -Dm755 -d "${pkgdir}/opt"
    cp -r "${srcdir}/usr/share/${pkgname%-bin}" "${pkgdir}/opt"
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/opt/${pkgname%-bin}"
    sed "s|Exec=${pkgname%-bin}|Exec=/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}