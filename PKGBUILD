# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="pritunl-client-bin"
pkgver=1.3.3585.79
pkgrel=1
pkgdesc="Pritunl OpenVPN client"
arch=('x86_64')
url="https://client.pritunl.com/"
_githuburl="https://github.com/pritunl/pritunl-client-electron"
license=('custom')
conflicts=("${pkgname%-bin}-electron")
depends=('glibc')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}-0ubuntu1.kinetic_amd64.deb"
        "LICENSE::https://raw.githubusercontent.com/pritunl/pritunl-client-electron/master/LICENSE")
sha256sums=('a0521f2c3b9a3c72fd1ebca1a9883b7eff95aa7df85b75a78ebc3b779a732326'
            '890ace4699add48d4ac60cb109cdd4368d44f4138ed8820ac36366e9421253f0')
package() {
    bsdtar -xf data.tar.zst -C "${pkgdir}"
    install -Dm755 "${pkgdir}/etc/systemd/system/${pkgname%-bin}.service" -t "${pkgdir}/usr/lib/systemd/system/"
    rm -rf "${pkgdir:?}/etc"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}