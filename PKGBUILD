# Maintainer: Alex Parrill <alex.parrill@col32.net>

pkgname=glauth-bin
pkgver=2.0.0
pkgrel=1
pkgdesc="LDAP authentication server for developers"
arch=('x86_64')
url="https://github.com/glauth/glauth"
license=('MIT')
source=(
    "glauth::https://github.com/glauth/glauth/releases/download/v${pkgver}/glauth64"
    "glauth.cfg::https://raw.githubusercontent.com/glauth/glauth/v${pkgver}/sample-simple.cfg"
    "glauth.service"
    "glauth-user.conf"
)
sha256sums=(
    '5995d2f45a89380640e61d7d45c0884a2d61e54e1c63261970a60ae5e3b0a54f'
    '0cc0689620da8f96419f6f74cd3e920863cad1125072f74528dd042a93decf5d'
    'SKIP'
    'SKIP'
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
