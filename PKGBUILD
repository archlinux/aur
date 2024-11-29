# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
pkgname=veyon-bin
pkgver=4.9.1
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
sha256sums=('9182088cffcf6c03c7f69447fbcb3d3a9cc1c7f9b4f4a39b4dbcca3a074047a4')

build() {
    sed -i "s/\/usr\/bin\///g" "${srcdir}/usr/share/applications/${pkgname%-bin}-"{master,configurator}.desktop
}
package() {
    install -Dm755 "${srcdir}/usr/bin/"* -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/lib/systemd/system/${pkgname%-bin}.service" -t "${pkgdir}/usr/lib/systemd/system"
    install -Dm644 "${srcdir}/usr/lib64/${pkgname%-bin}/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/usr/share" "${pkgdir}/usr"
}
