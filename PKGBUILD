# Maintainer: Carsten Feuls <archlinux dot carstenfeuls dot de>

pkgname=check_bareos-git
_pkgname=check_bareos
pkgver=r25.85f183b
pkgrel=1
pkgdesc="Icinga Plugin to check Bareos Backup Director databases"
arch=('any')
url="https://github.com/widhalmt/check_bareos"
license=('GPLv3')
depends=('python' 'python-psycopg2' 'mysql-python')
optdepends=('postgresql' 'mariadb')
source=("git+https://github.com/widhalmt/check_bareos.git")
sha512sums=('SKIP')

pkgver() {
        cd ${srcdir}/${_pkgname}
        echo "r$(git rev-list --count HEAD).$(git describe --always)"
}

package() {
        cd ${srcdir}/${_pkgname}
	mkdir -p "${pkgdir}/usr/lib/monitoring-plugins"
	cp check_bareos.py "${pkgdir}/usr/lib/monitoring-plugins/"
	chmod o+rx "${pkgdir}/usr/lib/monitoring-plugins/check_bareos.py"
	mkdir -p "${pkgdir}/usr/share/icinga2/include/plugins-contrib.d/"
	cp "contrib/icinga2-commands.conf" "${pkgdir}/usr/share/icinga2/include/plugins-contrib.d/bareos.conf"
	mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
	cp LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/"
}

