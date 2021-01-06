# Maintainer: m00n <lmarianski@protonmail.com>
# Contributor: artoo <artoo@artixlinux.org>

pkgname=device-mapper-openrc
pkgver=20210106
pkgrel=1
pkgdesc="OpenRC device-mapper init script"
arch=('any')
license=('GPL2')
provides=('init-device-mapper')
depends=('device-mapper' 'openrc')
conflicts=('init-device-mapper')
backup=('etc/conf.d/device-mapper')
source=("device-mapper.confd"
        "device-mapper.initd"
        "dmeventd.initd")
sha256sums=('57777904f12a35617e5a4193c964ebb32396452487fd02353e71e16e7b46bc22'
            '630fbe07721c2a264c1b2f0195caf658c591bdef13cb82d5605bb489f59971a4'
            'b4b91555f1486754717073dae83715d1e03adfdd5e56d80be8ac9689a85bc717')

package() {
    install -Dm755 "${srcdir}"/device-mapper.confd "${pkgdir}"/etc/openrc/conf.d/device-mapper

    for f in device-mapper dmeventd; do
        install -Dm755 "${srcdir}"/"$f".initd "${pkgdir}"/etc/openrc/init.d/"$f"
    done
}
