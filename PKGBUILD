# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=pritunl-client-bin
pkgver=1.3.4059.45
pkgrel=1
pkgdesc="Pritunl OpenVPN client.Written in GO.Prebuilt version."
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
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}-0ubuntu1.noble_amd64.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/pritunl/pritunl-client-electron/${pkgver}/LICENSE"
)
sha256sums=('5f7dfcb828a5d66a996f17fdb19cc11c5088c4ea5c0c694558f234fb3e34f9f4'
            '6b09590452456242b5970ac0c3bc9a5a9db1792ce4465d5e8cea1d7ba4080cda')
build() {
    bsdtar -xf "${srcdir}/data."*
}
package() {
    install -Dm755 "${srcdir}/usr/bin/"* -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/var/log/"* -t "${pkgdir}/var/log"
    install -Dm644 "${srcdir}/etc/systemd/system/${pkgname%-bin}.service" -t "${pkgdir}/usr/lib/systemd/system/"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
