# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
pkgname=veyon-bin
pkgver=4.11.4
pkgrel=1
pkgdesc="Cross-platform computer monitoring and classroom management."
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
sha256sums=('f9a3ddcb58a6fea67fd2490bffe51b4f3f88a100a9e48685b1b86e4f4a7a5183')
prepare() {
    bsdtar -xf "${srcdir}/data."*
    sed -i "s/\/usr\/bin\///g" "${srcdir}/usr/share/applications/${pkgname%-bin}-"{master,configurator}.desktop
}
package() {
    install -Dm755 "${srcdir}/usr/bin/"* -t "${pkgdir}/usr/bin"
    cp -a "${srcdir}/usr/lib" "${pkgdir}/usr"
    cp -a "${srcdir}/usr/share" "${pkgdir}/usr"
}
