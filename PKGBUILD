# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=check_ipmi_sensor
pkgver=3.13
pkgrel=1
pkgdesc='IPMI Sensor Monitoring Plugin'
arch=('any')
url='https://github.com/thomas-krenn/check_ipmi_sensor_v3'
license=('GPL')
depends=('freeipmi' 'perl-ipc-run')
optdepends=('sudo: check localhost without authentication')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/thomas-krenn/check_ipmi_sensor_v3/archive/v${pkgver}.tar.gz"
	'sudo')
sha256sums=('03a7d65872fe60fb3d2a5e6ac1113a243fb25df98f501512171bad5b6216f6a8'
            'b23987df57d9d2d21437fda95c9714108caf7e75da43f9106cc82e4d3dde3fbc')

package() {
	cd "${srcdir}/${pkgname}_v3-${pkgver}"

	install -D -m 0755 check_ipmi_sensor ${pkgdir}/usr/lib/monitoring-plugins/check_ipmi_sensor
	install -D -m 0644 changelog ${pkgdir}/usr/share/doc/${pkgname}/changelog
	install -D -m 0644 README.md ${pkgdir}/usr/share/doc/${pkgname}/README.md
	install -D -m 0644 COPYING ${pkgdir}/usr/share/licenses/${pkgname}/COPYING

	install -d -m 0750 ${pkgdir}/etc/sudoers.d
	install -D -m 0440 ${srcdir}/sudo ${pkgdir}/etc/sudoers.d/check_ipmi_sensor
}

