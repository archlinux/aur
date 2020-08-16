# Maintainer: Fabio Manganiello <info@fabiomanganiello.com>

pkgname=platypush
pkgver=0.13.3
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
sha512sums=('5569b75c38949c73f759f4a6e1dd249a4aa0dfe5d0e893859c166814efafc09dcda91b5b642cb9ba2b36dadda2119fca155281491428dfc9b27d940646a374b6')

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

