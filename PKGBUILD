# Maintainer: Fabio Manganiello <info@fabiomanganiello.com>

_pkgname=platypush
pkgname=${_pkgname}-git
pkgver=0.13.5.r0.ac02becb
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
sha512sums=('f17d25adbc9f7b3d98affb09eed4c8d8de9ae9ac9815c3102ad8a6e97d5661b2257e785c0e734f85c6565bb28dc345e0df4ed9b3b715df00186055a197e75579')

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

