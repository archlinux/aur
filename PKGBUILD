# Maintainer: Alex S <alex@lagomor.ph>

pkgname=glauth-bin
pkgver=2.2.0
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
sha256sums=('546aa37ee96def22e24a93f77747bd16dccaa39dd09394e534beef89a5a7233c'
            'c2a586d8b14725412885dde6aa306e8c76ae6dde1b65b36227249eac2d89239b'
            'bedea8dd92cdd1713647ae962777151726e5999095a20aebd4ea4e2b25eeb2f8'
            '86f8117175cf268f049a2a7a16f38c00c241231f5c0db9aca994997bdfe2023d')
