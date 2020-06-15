# Maintainer: unknowndev <unknowndev at archlinux.info>

pkgname=acme.sh-systemd
pkgver=0.1.0
pkgrel=2
pkgdesc="Use systemd check for acme.sh (Let’s Encrypt) renewals"
arch=('any')
url="https://github.com/unknowndev233/${pkgname}"
license=('LGPL3')
depends=('systemd>=240' 'acme.sh')
backup=()
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('f63a106a4c9890ba466a19a475ccbe4ab88e122ffae295df3c78135e664eb52d13ebf2a296655f66c92ac981dfd98f899c4954bab793f162e316eb59ab6c903a')

package() {
    cd "${pkgname}-${pkgver}"
    sed -i '6 s/#Type=exec/Type=exec/'            "acme.sh.service"
    sed -i '7 s/Type=simple/#Type=simple/'        "acme.sh.service"
    install -Dm644 "acme.sh.service" -t           "${pkgdir}/usr/lib/systemd/system"
    install -Dm644 "acme.sh.timer" -t             "${pkgdir}/usr/lib/systemd/system"
#    install -Dm640 "account.conf" -t              "${pkgdir}/etc/acme.sh"
    mkdir -pm 0700 ${pkgdir}/{etc,var/log}/acme.sh
}
