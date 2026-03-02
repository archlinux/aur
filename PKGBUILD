# Maintainer: unknowndev <unknowndev at archlinux.info>

pkgname=acme.sh-systemd
pkgver=0.1.3
pkgrel=1
pkgdesc="A systemd units for renew certificates acquired via acme.sh"
arch=('any')
url="https://github.com/unknowndevQwQ/${pkgname}"
license=('LGPL3')
depends=('systemd>=240' 'acme.sh')
backup=()
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha512sums=('017ec75d9a570b3e0b9af923a3b2e9c87acf7130b92b8bad2c06513efac23ab9e2cfd342e34ae57ad29f3d81cb9e56071511c2a277eefa9b2fda865e53f65421')

package() {
    cd "${pkgname}-${pkgver}"
    sed -i '9 s/#Type=exec/Type=exec/'            "system/acme.sh.service"
    sed -i '10 s/Type=simple/#Type=simple/'       "system/acme.sh.service"
    sed -i '9 s/#Type=exec/Type=exec/'            "user/acme.sh.service"
    sed -i '10 s/Type=simple/#Type=simple/'       "user/acme.sh.service"
    install -Dm644 "system/acme.sh.service" -t    "${pkgdir}/usr/lib/systemd/system"
    install -Dm644 "system/acme.sh.timer" -t      "${pkgdir}/usr/lib/systemd/system"
    install -Dm644 "user/acme.sh.service" -t      "${pkgdir}/usr/lib/systemd/user"
    install -Dm644 "user/acme.sh.timer" -t        "${pkgdir}/usr/lib/systemd/user"
#    install -Dm644 "account.conf" -t              "${pkgdir}/usr/share/acme.sh"
    install -Dm640 "account.conf" -t              "${pkgdir}/etc/acme.sh"
    install -dm750 "${pkgdir}"/etc/acme.sh{,/certs}
    install -dm750 "${pkgdir}/var/log/acme.sh"
}
