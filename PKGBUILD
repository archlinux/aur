# Maintainer: Fabio Manganiello <fabio@manganiello.tech>

pkgname=platypush-git
pkgver=0.24.2.r0.4c8190ac
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
sha512sums=('2bfe3d430bad4cf3a91060d79f0d3b09305ca1d072976e4818490dff9a34e4f6aeae526c81aaf5c23f8aaccdd9a2acb89f9e85f191905ec97b46e4ca4b9bb9c6')

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

