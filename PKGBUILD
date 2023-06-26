# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Co-Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=veyon-bin
pkgver=4.8.0
pkgrel=2
pkgdesc="Cross-platform computer monitoring and classroom management"
arch=('x86_64')
url="https://veyon.io/"
_githuburl="https://github.com/veyon/veyon"
license=('GPL2')
depends=('procps-ng' 'libjpeg6-turbo' 'glibc' 'pam' 'libxext' 'libxrandr' 'libx11' 'lzo' 'libpng' 'libxtst' 'zlib' \
  'hicolor-icon-theme' 'openssl-1.1' 'gcc-libs' 'libxdamage' 'qt5-base' 'libxinerama' 'libxfixes' 'libxcomposite' 'libxi')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}.0-debian.bullseye_amd64.deb")
sha256sums=('6357342fc66e02e51f9d76ce72ccee5d37dd1f83e408cbd739712a7b5c9d2b1e')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
    mv "${pkgdir}/usr/lib/x86_64-linux-gnu/${pkgname%-bin}" "${pkgdir}/usr/lib"
    install -Dm755 "${pkgdir}/lib/systemd/system/${pkgname%-bin}.service" -t "${pkgdir}/usr/lib/systemd/user"
    rm -rf  "${pkgdir}/usr/lib/x86_64-linux-gnu" "${pkgdir}/lib"
    chmod 0755 "${pkgdir}/usr/bin/veyon-auth-helper"
}