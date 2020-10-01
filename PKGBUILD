# Maintainer: Fabio Manganiello <info@fabiomanganiello.com>

_pkgname=platypush
pkgname=${_pkgname}-git
pkgver=0.13.6.r0.8d7e790e
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
sha512sums=('ce7dbab653e9f67c2d69ee4e02684ec2c40dd9b8c9ffb0d1a61db4649840fcb9b3386b4c19adf7182a1c2ac8ceabe23a0ad5aad9224dc602dfba918d0c37d350')

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

