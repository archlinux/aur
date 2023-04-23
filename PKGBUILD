# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="pritunl-client-bin"
pkgver=1.3.3484.2
pkgrel=2
pkgdesc="Pritunl OpenVPN client"
arch=('x86_64')
url="https://client.pritunl.com/"
_githuburl="https://github.com/pritunl/pritunl-client-electron"
license=('custom')
conflicts=("${pkgname%-bin}-electron")
depends=('glibc')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}-0ubuntu1.kinetic_amd64.deb"
        "LICENSE::${_githuburl}/raw/master/LICENSE")
sha256sums=('7c2d8be9de5f330dba123f2d5889c94c6d137f58dabac06b699d342ed52a4378'
            '244029a028871fca0a45c34f9f517848d7624bd6d4b899dd7678bd8c6f61e07d')
  
package() {
    bsdtar -xf data.tar.zst -C "${pkgdir}"
    install -Dm755 "${pkgdir}/etc/systemd/system/${pkgname%-bin}.service" -t "${pkgdir}/usr/lib/systemd/system/"
    rm -rf "${pkgdir:?}/etc"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}