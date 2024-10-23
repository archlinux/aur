# Maintainer: 
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=veyon-bin
pkgver=4.9.0
pkgrel=2
pkgdesc="Cross-platform computer monitoring and classroom management.Prebuilt version."
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
    'procps-ng'
    'libvncserver'
    'qt6-httpserver'
    'libxcursor'
    'qt6-websockets'
    'qt6-5compat'
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}.0-fedora.40.${CARCH}.rpm"
)
sha256sums=('ec7d9f756d4e0b88c12e808d99d085222de126bb18824c40ae245406ac270cfd')

build() {
    sed -i "s/\/usr\/bin\///g" "${srcdir}/usr/share/applications/${pkgname%-bin}-"{master,configurator}.desktop
}
package() {
    install -Dm755 "${srcdir}/usr/bin/"* -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/lib/systemd/system/${pkgname%-bin}.service" -t "${pkgdir}/usr/lib/systemd/system"
    install -Dm644 "${srcdir}/usr/lib64/${pkgname%-bin}/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/usr/share" "${pkgdir}/usr"
}