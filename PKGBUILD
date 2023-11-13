# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=inethi-bin
pkgver=1.0.1
pkgrel=2
pkgdesc="A GUI installer that can set up the iNethi Docker environment."
arch=("x86_64")
url="https://www.inethi.org.za/software/"
_githuburl="https://github.com/iNethi/inethi-network-builder"
license=("custom")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'electron23'
    'python>=3'
    'python-lxml'
    'python-pytz'
    'python-pillow'
    'python-importlib-metadata'
    'python-ptyprocess'
    'python-wheel'
    'python-docutils'
    'python-yaml'
    'python-six'
    'python-pexpect'
    'python-trove-classifiers'
    'python-cryptography'
    'python-typing_extensions'
    'python-platformdirs'
    'python-packaging'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('9e56a8eefe66574e99d04d198da338fc0577b2714450b1a61763d87b536e39dc'
            'bb1bb91a1de21aee594d24a3e7e5883bc6f3ddf0269f52f16f376c84c4657a90')
build() {
    bsdtar -xf "${srcdir}/data.tar.zst"
    sed "s| %U||g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/usr/lib/${pkgname%-bin}/resources/app" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/doc/${pkgname%-bin}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}