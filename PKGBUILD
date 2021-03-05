# Maintainer: Fabio Manganiello <info@fabiomanganiello.com>

pkgname=platypush-git
pkgver=0.20.3.r0.36aee6f7
pkgrel=1
pkgdesc="Universal multi-platform command executor and automation manager"
arch=('any')
license=('MIT')
url="https://git.platypush.tech/platypush/platypush"
depends=('python' 'python-yaml' 'redis' 'python-redis' 'python-requests' 'python-sqlalchemy' 'python-websockets' 'python-websocket-client' 'python-wheel' 'python-flask' 'python-pip' 'python-dateutil' 'python-frozendict' 'python-bcrypt' 'python-zeroconf' 'python-pyjwt' 'python-croniter')
optdepends=('python-paho-mqtt: MQTT integrations support'
	'python-pybluez: Bluetooth support'
	'python-gattlib: Low-energy Bluetooth devices support'
	'python-paramiko: SSH support'
	'python-pyserial: Arduino/serial device support')
conflicts=('platypush')
provides=('platypush')
options=(!strip)
source=("platypush.tar.gz::https://git.platypush.tech/platypush/platypush/-/archive/master/platypush-master.tar.gz")
sha512sums=('227a15dbdf163cb43374edca67c1229ddfe9c29a8e77e3ce0bac8b63db365f969714c4242214c712c5ac73896bdd942998079f7d98680179a77d75ca2cdfe08b')

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

