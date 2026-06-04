# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
pkgname=veyon-bin
pkgver=4.10.4
pkgrel=1
pkgdesc="Cross-platform computer monitoring and classroom management.(Prebuilt version)"
arch=('x86_64')
url="https://veyon.io/"
_ghurl="https://github.com/veyon/veyon"
license=('GPL-2.0-or-later')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'libfakekey'
    'libxcomposite'
    'libxdamage'
    'libxext'
    'libxfixes'
    'libxinerama'
    'libxrandr'
    'libxtst'
    'pam'
    'qca-qt6'
    'qt6-base'
)
source=("${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}.0-ubuntu.26.04_amd64.deb")
sha256sums=('eaa976e1923382a185ed9a8ee1e9ea37e36b4b78006308c24e7d2c27da572058')
prepare() {
    bsdtar -xf "${srcdir}/data."*
    sed -i "s/\/usr\/bin\///g" "${srcdir}/usr/share/applications/${pkgname%-bin}-"{master,configurator}.desktop
}
package() {
    install -Dm755 "${srcdir}/usr/bin/"* -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/lib/systemd/system/${pkgname%-bin}.service" -t "${pkgdir}/usr/lib/systemd/system"
    install -Dm644 "${srcdir}/usr/lib/${CARCH}-linux-gnu/${pkgname%-bin}/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/usr/lib" "${pkgdir}/usr"
    cp -Pr --no-preserve=ownership "${srcdir}/usr/share" "${pkgdir}/usr"
}
