# Mantainer: Alessio <alessio@linux.com>
# Contributor: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="pritunl-client-electron"
_appname="pritunl_client_electron"
pkgver=1.3.3600.11
pkgrel=3
pkgdesc="Pritunl OpenVPN client"
arch=('x86_64')
url="https://client.pritunl.com/"
_githuburl="https://github.com/pritunl/pritunl-client-electron"
license=('custom')
conflicts=("${pkgname%-electron}")
depends=('electron' 'nodejs' 'npm' 'gettext')
source=("${pkgname}-${pkgver}.deb::${_githuburl}/releases/download/${pkgver}/${pkgname}_${pkgver}-0ubuntu1.kinetic_amd64.deb"
        "LICENSE::${_githuburl}/raw/master/LICENSE")
sha256sums=('6da23d2cf4a15a6a322829473660d8f2ae209b192c010088e76595431bfdfb06'
            '890ace4699add48d4ac60cb109cdd4368d44f4138ed8820ac36366e9421253f0')
  
package() {
    bsdtar -xf data.tar.zst -C "${pkgdir}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm755 "${pkgdir}/etc/systemd/system/${pkgname%-electron}.service" -t "${pkgdir}/usr/lib/systemd/system/"
    rm -rf "${pkgdir:?}/etc" \
        "${pkgdir}usr/lib/${_appname}/resources/app/node_modules/ajv/scripts/info" \
        "${pkgdir}/usr/lib/${_appname}/resources/app/node_modules/sshpk/man/man1/sshpk-verify.1" \
        "${pkgdir}/usr/lib/${_appname}/resources/app/node_modules/sshpk/man/man1/sshpk-sign.1" \
        "${pkgdir}/usr/lib/${_appname}/resources/app/node_modules/sshpk/man/man1/sshpk-conv.1" \
        "${pkgdir}/usr/lib/${_appname}/resources/app/node_modules/ajv/scripts/info"
}
