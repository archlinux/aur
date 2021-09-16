# Maintainer: Fabio Manganiello <info@fabiomanganiello.com>

pkgname=platypush-git
pkgver=0.22.0.r0.a2f57554
pkgrel=1
pkgdesc="Universal multi-platform command executor and automation manager"
arch=('any')
license=('MIT')
url="https://git.platypush.tech/platypush/platypush"
depends=('python' 'python-yaml' 'redis' 'python-redis' 'python-requests' 'python-sqlalchemy' 'python-websockets' 'python-websocket-client' 'python-wheel' 'python-flask' 'python-pip' 'python-dateutil' 'python-frozendict' 'python-bcrypt' 'python-zeroconf' 'python-pyjwt' 'python-croniter' 'python-marshmallow' 'python-pytz')
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
source=("platypush.tar.gz::https://git.platypush.tech/platypush/platypush/-/archive/master/platypush-master.tar.gz")
sha512sums=('e7e66bbf8dcb34dfcc867ac551f406b4a96115d6a27630b72567229abc8e701bd88dda29c484cb17c3462b705a17dd9c60bf00b90216f9e6206b4c6be178ca52')

package() {
    cd "${srcdir}/platypush-master"
    python3 setup.py install --root="${pkgdir}/" --optimize=1

    install -m755 -d "${pkgdir}/usr/lib/systemd/user"
    install -m644 "${srcdir}/platypush-master/examples/systemd/platypush.service" "${pkgdir}/usr/lib/systemd/user"

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

