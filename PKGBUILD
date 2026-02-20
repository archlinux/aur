# Maintainer: Alex S <alex@lagomor.ph>

pkgname=glauth-bin
pkgver=2.4.0
pkgrel=1
pkgdesc="LDAP authentication server for developers"
arch=('x86_64')
url="https://github.com/glauth/glauth"
license=('MIT')
source=(
    "glauth::https://github.com/glauth/glauth/releases/download/v${pkgver}/glauth-linux-amd64"
    "glauth.cfg::https://raw.githubusercontent.com/glauth/glauth/v${pkgver}/v2/sample-simple.cfg"
    "glauth.service"
    "glauth-user.conf"
)
backup=(
    "etc/glauth/glauth.cfg"
)
install="glauth.install"

package() {
    install -Dm755 "${srcdir}/glauth" "${pkgdir}/usr/bin/glauth"
    install -d "${pkgdir}/etc/glauth/"
    echo "# See docs to configure, or glauth-sample.cfg for a sample" > "${pkgdir}/etc/glauth/glauth.cfg"
    # Not allowing read access to other users, so that they can't get password hashes
    chmod 600 "${pkgdir}/etc/glauth/glauth.cfg"
    install -Dm644 "${srcdir}/glauth.cfg" "${pkgdir}/etc/glauth/glauth-sample.cfg"
    install -Dm644 "${srcdir}/glauth.service" "${pkgdir}/usr/lib/systemd/system/glauth.service"
    install -Dm644 "${srcdir}/glauth-user.conf" "${pkgdir}/usr/lib/sysusers.d/glauth.conf"
}
sha256sums=('bb74391703486d9bea166b0add57993731526f8913f50483aa6a8da09c4108b4'
            '0bb955b5274b013c964b1e53270e6443acf37431db0c6c81f268e1cf04ba08d8'
            '8e567067a8f244371d6d626c2a771afed5dcc02252efa1a464b2adc6597e2726'
            '86f8117175cf268f049a2a7a16f38c00c241231f5c0db9aca994997bdfe2023d')
