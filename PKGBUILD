# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=check_ipmi_sensor
pkgver=3.3
pkgrel=4
pkgdesc="IPMI Sensor Monitoring Plugin"
arch=('any')
url="http://exchange.nagios.org/directory/Plugins/Hardware/Server-Hardware/IPMI-Sensor-Monitoring-Plugin/details"
license=('GPL')
depends=('nagios' 'freeipmi' 'perl-ipc-run')
optdepends=('sudo: check localhost without authentication')
source=("${pkgname}-${pkgver}.tar.gz::http://git.thomas-krenn.com/?p=check_ipmi_sensor_v3.git;a=snapshot;h=refs/tags/v${pkgver};sf=tgz"
	'localhost.patch'
	'sudo')
sha256sums=('470ec6c228018bf246df5b5b063a12beccc90a780fd921d7542a86282e469966'
            'b0defc4ac4c4252178dcdedfcaa01a45a96a04b8c7ee7b575081ff86e1f2a82e'
            '41208e539ede1180c638be8381712fe2b7149fdc92c90fe80e335f4f7c560a9e')

prepare() {
	cd "${srcdir}/${pkgname}_v3-v${pkgver}"

	patch -Np1 < ${srcdir}/localhost.patch
}

package() {
	cd "${srcdir}/${pkgname}_v3-v${pkgver}"

	install -D -m 0755 check_ipmi_sensor ${pkgdir}/usr/lib/monitoring-plugins/check_ipmi_sensor
	install -D -m 0644 changelog.txt ${pkgdir}/usr/share/doc/${pkgname}/changelog.txt
	install -D -m 0644 README ${pkgdir}/usr/share/doc/${pkgname}/README
	install -D -m 0644 gpl.txt ${pkgdir}/usr/share/licenses/${pkgname}/gpl.txt

	install -d -m 0750 ${pkgdir}/etc/sudoers.d
	install -D -m 0440 ${srcdir}/sudo ${pkgdir}/etc/sudoers.d/check_ipmi_sensor
}

