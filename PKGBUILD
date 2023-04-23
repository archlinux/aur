# Maintainer: Fabio Manganiello <fabio@manganiello.tech>

pkgname=platypush-git
pkgver=0.24.5.r0.bfa296e7
pkgrel=1
pkgdesc="Universal multi-platform command executor and automation manager"
arch=('any')
license=('MIT')
url="https://git.platypush.tech/platypush/platypush"
makedepends=('git')
depends=('python' 'python-yaml' 'redis' 'python-redis' 'python-requests' 'python-sqlalchemy' 'python-websockets' 'python-websocket-client' 'python-wheel' 'python-flask' 'python-pip' 'python-dateutil' 'python-frozendict' 'python-bcrypt' 'python-zeroconf' 'python-rsa' 'python-croniter' 'python-marshmallow' 'python-pytz' 'python-magic')
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
source=("master.tar.gz::https://git.platypush.tech/platypush/platypush/archive/master.tar.gz")
sha512sums=('ef19005ff1e0de13f50f7d69c05b0a0d1f740980ed49048ec499717cfbffdc74a9bc3081ca10abfe72f7318e6ee1ca7dc8311165350d739c5cfa293690bd7fa7')

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

