# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="pritunl-client-electron"
_appname="pritunl_client_electron"
pkgver=1.3.3484.2
pkgrel=2
pkgdesc="Pritunl OpenVPN client"
arch=('x86_64')
url="https://client.pritunl.com/"
_githuburl="https://github.com/pritunl/pritunl-client-electron"
license=('custom')
conflicts=("${pkgname%-electron}")
depends=('glib2' 'java-runtime' 'libxcb' 'libxkbcommon' 'libxfixes' 'at-spi2-core' 'dbus' 'mesa' 'nss' 'nodejs' 'libxcomposite' \
    'libx11' 'nspr' 'gcc-libs' 'cairo' 'libxext' 'libdrm' 'pango' 'libxrandr' 'libxdamage' 'libcups' 'expat' 'gtk3' 'alsa-lib' \
    'hicolor-icon-theme' 'sh' 'glibc')
source=("${pkgname}-${pkgver}.deb::${_githuburl}/releases/download/${pkgver}/${pkgname}_${pkgver}-0ubuntu1.kinetic_amd64.deb"
        "LICENSE::${_githuburl}/raw/master/LICENSE")
sha256sums=('2b84585df7222d4a4bbb89ee15d042254277d7f95c2da5945fa3cfe8881a71d0'
            '244029a028871fca0a45c34f9f517848d7624bd6d4b899dd7678bd8c6f61e07d')
  
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