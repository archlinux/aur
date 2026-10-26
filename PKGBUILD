# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=pritunl-client-bin
pkgver=1.4.4791.77
pkgrel=1
pkgdesc="Pritunl OpenVPN and WireGuard client."
arch=('x86_64')
url="https://client.pritunl.com/"
_ghurl="https://github.com/pritunl/pritunl-client-electron"
_dlurl="https://repo.pritunl.com/stable/pacman/"
license=('LicenseRef-custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=(
    "${pkgname%-bin}"
    "${pkgname%-bin}-electron"
)
depends=(
    'openvpn'
)
source=(
    "${pkgname%-bin}-${pkgver}.pkg.tar.zst::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}-${pkgver}-1-${CARCH}.pkg.tar.zst"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/pritunl/pritunl-client-electron/${pkgver}/LICENSE"
)
sha256sums=('27ebdd7168912b4208b29af6d3e1ca08be6bd651aa84c645b0aaf1142490b86a'
            'dfc7f459464abab04f166258117caf65f82a807f29cd1c1aa93e82295f1e85bc')
package() {
    install -Dm755 "${srcdir}/usr/bin/"* -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/var/log/"* -t "${pkgdir}/var/log"
    install -Dm644 "${srcdir}/etc/systemd/system/${pkgname%-bin}.service" -t "${pkgdir}/usr/lib/systemd/system/"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
