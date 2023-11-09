# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=pritunl-client-bin
pkgver=1.3.3709.64
pkgrel=1
pkgdesc="Pritunl OpenVPN client"
arch=('x86_64')
url="https://client.pritunl.com/"
_ghurl="https://github.com/pritunl/pritunl-client-electron"
license=('custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-electron")
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}-0ubuntu1.xenial_amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/pritunl/pritunl-client-electron/${pkgver}/LICENSE"
)
sha256sums=('462d44b6181eccd42f0d091260a0bc5fed07134196a303227b332d0f4501e5ff'
            '890ace4699add48d4ac60cb109cdd4368d44f4138ed8820ac36366e9421253f0')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/"* -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/var/log/"* -t "${pkgdir}/var/log"
    install -Dm644 "${srcdir}/etc/systemd/system/${pkgname%-bin}.service" -t "${pkgdir}/usr/lib/systemd/system/"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}