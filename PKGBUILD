# Maintainer: Fabio Manganiello <info@fabiomanganiello.com>

pkgname=platypush-git
pkgver=0.23.3.r0.1a316bc3
pkgrel=2
pkgdesc="Universal multi-platform command executor and automation manager"
arch=('any')
license=('MIT')
url="https://git.platypush.tech/platypush/platypush"
makedepends=('git')
depends=('python' 'python-yaml' 'redis' 'python-redis' 'python-requests' 'python-sqlalchemy' 'python-websockets' 'python-websocket-client' 'python-wheel' 'python-flask' 'python-pip' 'python-dateutil' 'python-frozendict' 'python-bcrypt' 'python-zeroconf' 'python-pyjwt' 'python-croniter' 'python-marshmallow' 'python-pytz' 'python-magic')
optdepends=('python-paho-mqtt: MQTT integrations support'
	'python-pybluez: Bluetooth support'
	'python-gattlib: Low-energy Bluetooth devices support'
	'python-paramiko: SSH support'
	'python-watchdog: File monitor support'
	'python-aiohttp: SmartThings support'
	'python-pyserial: Arduino/serial device support')
conflicts=('platypush')
provides=('platypush')
options=(!strip)
source=("git+https://git.platypush.tech/platypush/platypush")
sha512sums=('SKIP')

package() {
    cd "${srcdir}/platypush"
    python3 setup.py install --root="${pkgdir}/" --optimize=1

    install -m755 -d "${pkgdir}/usr/lib/systemd/user"
    install -m644 "${srcdir}/platypush/examples/systemd/platypush.service" "${pkgdir}/usr/lib/systemd/user"

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

