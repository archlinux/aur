# Maintainer: unknowndev <unknowndev at archlinux.info>

pkgname=acme.sh-systemd
pkgver=0.1.2
pkgrel=2
pkgdesc="A systemd units for renew certificates acquired via acme.sh"
arch=('any')
url="https://github.com/unknowndevQwQ/${pkgname}"
license=('LGPL3')
depends=('systemd>=240' 'acme.sh')
backup=()
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha512sums=('086d3c4c2209912f314a3391c52811811a774cdcb079038299bba8e56d2a9236bdcc46705b1335e33a5524cff1bde7744b7ccabed6c3c9b57d2e69a43504e530')

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
