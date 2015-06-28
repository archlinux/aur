# Maintainer: Erhan SAHIN <erhan@ssahin.net>

pkgname=neutron-lbaas-kilo
pkgver=2015.1.0
pkgrel=2
pkgdesc="Neutron Load Balance as a Service service"
arch=(any)
install=neutron-lbaas.install
url=https://launchpad.net/neutron
license=(Apache)
depends=('python2-pbr>=0.6'
         'python2-pbr<1.0'
         'python2-eventlet>=0.16.1'
         'python2-requests>=2.2'
         'python2-netaddr>=0.7.12'
         'python2-sqlalchemy-kilo'
         'python2-alembic>=0.7.2'
         'python2-six>=1.9.0'
         'python2-oslo-config-kilo'
         'python2-oslo-db-kilo'
         'python2-oslo-log-kilo'
         'python2-oslo-messaging-kilo'
         'python2-oslo-serialization-kilo'
         'python2-oslo-utils-kilo'
         'python2-barbicanclient-kilo'
         'python2-pyasn1'
         'python2-pyasn1-modules'
         'python2-pyopenssl>=0.11')
makedepends=(python2-setuptools)
source=("https://launchpad.net/neutron/kilo/${pkgver}/+download/neutron-lbaas-${pkgver}.tar.gz"
        "neutron-lbaas-agent.service"
        "neutron-lbaasv2-agent.service")
md5sums=('f6ea7d731165f95734cbd7ae7c9a85c9'
         '374510e3b4e89adf5803403f2c9ed3e6'
         '2d0b73dba640cc3ca6bbd32a5953cbd5')

build() {
    cd neutron-lbaas-${pkgver}/
    python2 setup.py build
}

package() {
    cd neutron-lbaas-${pkgver}/
    python2 setup.py install --root="${pkgdir}" --optimize=1
    mv "${pkgdir}"/usr/etc "${pkgdir}"/
    install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/neutron-lbaas/LICENSE
    install -D -m 644 ${srcdir}/neutron-lbaas-agent.service ${pkgdir}/usr/lib/systemd/system/neutron-lbaas-agent.service
    install -D -m 644 ${srcdir}/neutron-lbaasv2-agent.service ${pkgdir}/usr/lib/systemd/system/neutron-lbaasv2-agent.service
}

