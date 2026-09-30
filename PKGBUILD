# Maintainer: Martin Rys <https://rys.rs/contact>
# Contributor: Michael Clayfield <me@michaelclayfield.com>
# Contributor: Malte Rabenseifner <mail@malte-rabenseifner.de>

pkgname=icingaweb2-module-director
pkgver=1.12.1
pkgrel=1
pkgdesc="Manage Icinga 2 configuration from Icinga Web 2"
license=('GPL-3.0-or-later')
arch=('any')
depends=(
	'icingaweb2'
	'icinga-php-legacy'
)
url="https://github.com/Icinga/icingaweb2-module-director"
install="icingaweb2-module-director.install"
source=(
	"${pkgname}-${pkgver}.tar.gz::https://github.com/Icinga/${pkgname}/archive/v${pkgver}.tar.gz"
	"${pkgname}.sysusers"
)
sha256sums=('6eed9db27ac0c14b13411bde6f3f1de86cd3ed3032181e1cb5938055acee8671'
            '311043f4f4da68e5fcf8ad8593475d8287fe2f681e52940b33d41bc681d74cec')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	install -dm770 "${pkgdir}/etc/icingaweb2/modules/director"
	chmod 2770 "${pkgdir}/etc/icingaweb2"
	mkdir -p "${pkgdir}/usr/share/webapps/icingaweb2/modules/director"

	cp -r * "${pkgdir}/usr/share/webapps/icingaweb2/modules/director"

	install -Dm644 "${srcdir}/${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
	install -Dm644 "contrib/systemd/icinga-director.service" "${pkgdir}/usr/lib/systemd/system/icinga-director.service"
}
