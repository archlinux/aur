# Maintainer: Fabio Manganiello <info@fabiomanganiello.com>

pkgname=platypush
pkgver=0.13.2
pkgrel=1
pkgdesc="Universal multi-platform command executor and automation manager"
arch=('any')
license=('MIT')
url="https://github.com/BlackLight/platypush"
depends=('python' 'python-yaml' 'redis' 'python-redis' 'python-requests' 'python-sqlalchemy' 'python-websockets' 'python-websocket-client' 'python-wheel' 'python-flask'
	'python-dateutil' 'python-frozendict' 'python-bcrypt')
optdepends=('python-paho-mqtt: MQTT integrations support'
	'python-pybluez: Bluetooth support'
	'python-gattlib: Low-energy Bluetooth devices support'
	'python-paramiko: SSH support'
    'python-croniter: Platypush cron support'
	'python-pyserial: Arduino/serial device support')
conflicts=('platypush-git')
options=(!strip)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/BlackLight/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('d78e39295f3ec70f475847115e4f9adb5cdebcb5af2ccd4ba84c99d97bd466725ac0f3bdc7bf7579cfa324376c4bf5735d4808b4007052ca1c635269003c39f4')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python3 setup.py build install --root="${pkgdir}/" --optimize=1

    install -m755 -d "${pkgdir}/usr/lib/systemd/user"
    install -m644 "${srcdir}/${pkgname}-${pkgver}/examples/systemd/platypush.service" "${pkgdir}/usr/lib/systemd/user"

    echo
    echo
    echo ---------------------------------------------
    echo You can start the Platypush service through
    echo systemctl --user start platypush.
    echo
    echo Remember to enable/start the Redis service
    echo before starting Platypush.
    echo ---------------------------------------------
    echo
    echo
}

