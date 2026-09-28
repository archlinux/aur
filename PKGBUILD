# Maintainer: Alex S <alex@lagomor.ph>

pkgname=glauth-bin
pkgver=2.5.4
pkgrel=1
pkgdesc="LDAP authentication server for developers"
arch=('x86_64')
url="https://github.com/glauth/glauth"
license=('MIT')
depends=('glibc')
source=(
    "glauth::https://github.com/glauth/glauth/releases/download/GLAuth-v${pkgver}/glauth-linux-amd64"
    "glauth.cfg::https://raw.githubusercontent.com/glauth/glauth/GLAuth-v${pkgver}/v2/sample-simple.cfg"
    "LICENSE::https://raw.githubusercontent.com/glauth/glauth/GLAuth-v${pkgver}/LICENSE"
    "glauth.service"
    "glauth-user.conf"
    "glauth-tmpfiles.conf"
)
backup=(
    "etc/glauth/glauth.cfg"
)

package() {
    install -Dm755 "${srcdir}/glauth" "${pkgdir}/usr/bin/glauth"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -d "${pkgdir}/etc/glauth/"
    echo "# See docs to configure, or glauth-sample.cfg for a sample" > "${pkgdir}/etc/glauth/glauth.cfg"
    # Not allowing read access to other users, so that they can't get password hashes
    chmod 600 "${pkgdir}/etc/glauth/glauth.cfg"
    install -Dm644 "${srcdir}/glauth.cfg" "${pkgdir}/etc/glauth/glauth-sample.cfg"

    install -Dm644 "${srcdir}/glauth.service" "${pkgdir}/usr/lib/systemd/system/glauth.service"
    install -Dm644 "${srcdir}/glauth-user.conf" "${pkgdir}/usr/lib/sysusers.d/glauth.conf"
    install -Dm644 "${srcdir}/glauth-tmpfiles.conf" "${pkgdir}/usr/lib/tmpfiles.d/glauth.conf"
}
sha256sums=('365ccc46697a1abd349444b71a32815bfdd25bd222dcb0b4e5c4f18558738a7a'
            '0bb955b5274b013c964b1e53270e6443acf37431db0c6c81f268e1cf04ba08d8'
            '4c7d0cafa92d902fe9a68c4899b15c621626ab6a394f7d98717e67aa19213aee'
            'b93c1b6e2c87a4a6fc31f1845287f4741c906d72b74f04099ea9b4f604ea02b3'
            '86f8117175cf268f049a2a7a16f38c00c241231f5c0db9aca994997bdfe2023d'
            '661c589ad65ac432b597deed49f61a77394b681e61f6a786d6a53415a5ad4612')
