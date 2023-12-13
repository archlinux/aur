# Maintainer: unknowndev <unknowndev at archlinux.info>

pkgname=acme.sh-systemd
pkgver=0.1.1
pkgrel=1
pkgdesc="A systemd units for renew certificates acquired via acme.sh"
arch=('any')
url="https://github.com/unknowndevQwQ/${pkgname}"
license=('LGPL3')
depends=('systemd>=240' 'acme.sh')
backup=()
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha512sums=('616fcfadce7ca6ff6cae5765367416d14b5e02d3ab736ec438a89bc9baeddb138f54ba22f5a319cf01f3f30a74e01edc991caa962c1b5a1835e3f62452333ecb')

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
    chmod 0750 -R "${pkgdir}/etc/acme.sh"
    mkdir -pm 0750 "${pkgdir}/var/log/acme.sh"
}
