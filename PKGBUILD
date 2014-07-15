# Maintainer: James An <james@jamesan.ca>

pkgname=aegir
pkgver=0.1
pkgrel=1
pkgdesc="Aegir systemd target for a dedicated Aegir VPS."
arch=('any')
url='http://aegirproject.org'
license=('GPL')
depends=('systemd' 'aegir-hostmaster')
source=(
    aegir.target
    stop-when-unneeded.conf
)
md5sums=(
    80773e4278e09b14cc6843e346540a9d
    7e34786351f538d2db0bd2d3e64db43f
)

package() {
    install -Dm755 aegir.target "${pkgdir}/usr/lib/systemd/system/aegir.target"
    for service in aegir mysqld nginx php-fpm; do
        install -Dm755 stop-when-unneeded.conf "${pkgdir}/usr/lib/systemd/system/${service}.service.d/stop-when-unneeded.conf"
    done
}
