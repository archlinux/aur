# Maintainer: Fabio Manganiello <info@fabiomanganiello.com>

_pkgname=platypush
pkgname=${_pkgname}-git
pkgver=0.13.5.r0.2ceb3511
pkgrel=1
pkgdesc="Universal multi-platform command executor and automation manager"
arch=('any')
license=('MIT')
url="https://github.com/BlackLight/platypush"
depends=('python' 'python-yaml' 'redis' 'python-redis' 'python-requests' 'python-sqlalchemy' 'python-websockets' 'python-websocket-client' 'python-wheel' 'python-flask'
	'python-pip' 'python-dateutil' 'python-frozendict' 'python-bcrypt' 'python-zeroconf')
optdepends=('python-paho-mqtt: MQTT integrations support'
	'python-pybluez: Bluetooth support'
	'python-gattlib: Low-energy Bluetooth devices support'
	'python-paramiko: SSH support'
    'python-croniter: Platypush cron support'
	'python-pyserial: Arduino/serial device support')
conflicts=('platypush')
options=(!strip)
source=("${_pkgname}.tar.gz::https://github.com/BlackLight/${_pkgname}/archive/master.tar.gz")
sha512sums=('3ae9d1860dd31389680ea1b986651825a75f0647b6b308ebd652b7b49d69f139274cf710db3b5d2472068efa7cffdf7437f44b73fa7b53aed3aaee2b82be1288')

package() {
    cd "${srcdir}/${_pkgname}-master"
    python3 setup.py install --root="${pkgdir}/" --optimize=1

    install -m755 -d "${pkgdir}/usr/lib/systemd/user"
    install -m644 "${srcdir}/${_pkgname}-master/examples/systemd/platypush.service" "${pkgdir}/usr/lib/systemd/user"

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

