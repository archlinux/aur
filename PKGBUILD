# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=pritunl-client-bin
pkgver=1.3.4466.51
pkgrel=1
pkgdesc="Pritunl OpenVPN client.Written in GO.(Prebuilt version)"
arch=('x86_64')
url="https://client.pritunl.com/"
_ghurl="https://github.com/pritunl/pritunl-client-electron"
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
sha256sums=('b4c05640f71594f7951a282c82ad03df74699fa7c133976b76bea86ffa587d02'
            '761b7df4f789c4d98572a97c09c02918fd648066ff8c2c46c26713e349cd53ea')
package() {
    install -Dm755 "${srcdir}/usr/bin/"* -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/var/log/"* -t "${pkgdir}/var/log"
    install -Dm644 "${srcdir}/etc/systemd/system/${pkgname%-bin}.service" -t "${pkgdir}/usr/lib/systemd/system/"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
