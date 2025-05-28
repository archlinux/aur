# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
pkgname=veyon-bin
pkgver=4.9.6
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
    'qca-qt5'
    'qt5-base'
    'libprocps'
    'lzo'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}.0-ubuntu.22.04_amd64.deb"
)
sha256sums=('4d4031175b20cbe75b85f2088a6ed02f9d3a7f8b6ed4cb7c661b4a1299143cc4')

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
