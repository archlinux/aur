# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=certbox-bin
pkgver=1.7.1
pkgrel=1
pkgdesc="A X.509 certificate toolbox on your desktop or in your browser. It allows you to easily generate entire certificate chains, issue certificates from existing roots, clone certificates, and more."
arch=('aarch64' 'x86_64')
url="https://certbox.io/"
_githuburl="https://github.com/tls-inspector/certbox"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron26')
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_githuburl}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_githuburl}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_x64.deb")
source=("LICENSE::https://raw.githubusercontent.com/tls-inspector/certbox/${pkgver}/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('86a899de0d14686c5fc2a444067323ed7162e88718b9d0b045653383b6059719'
            'fe975d5b63ec9006d5baa93605607e8a71db2a19d30d43517724f987efd52373')
sha256sums_aarch64=('af4a20bc9e0a6fd2d0add893a93486a36800219f94b35c68e2ebd2b1250cece5')
sha256sums_x86_64=('73d5bf6548364bc7a8a67b7fba39085a1fff3619ec321372b400c4d01ece9ae6')
build() {
    bsdtar -xf "${srcdir}/data.tar.zst"
    sed "s| %U||g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}/resources"
    cp -r "${srcdir}/usr/lib/${pkgname%-bin}/resources/app" "${pkgdir}/opt/${pkgname%-bin}/resources"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}