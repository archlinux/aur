# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=pritunl-client-bin
pkgver=1.3.3600.11
pkgrel=2
pkgdesc="Pritunl OpenVPN client"
arch=('x86_64')
url="https://client.pritunl.com/"
_githuburl="https://github.com/pritunl/pritunl-client-electron"
license=('custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-electron")
depends=('glibc')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}-0ubuntu1.kinetic_amd64.deb"
        "LICENSE::https://raw.githubusercontent.com/pritunl/pritunl-client-electron/${pkgver}/LICENSE")
sha256sums=('0f283eb2f191c9687fb285210b9ed4b4c4bc5e587750442fe81e633ad2fcba38'
            '890ace4699add48d4ac60cb109cdd4368d44f4138ed8820ac36366e9421253f0')
prepare() {
    bsdtar -xf "${srcdir}/data.tar.zst"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/"* -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/var/log/"* -t "${pkgdir}/var/log"
    install -Dm644 "${srcdir}/etc/systemd/system/${pkgname%-bin}.service" -t "${pkgdir}/usr/lib/systemd/system/"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}