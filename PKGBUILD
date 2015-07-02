# Maintainer: Erhan SAHIN <erhan@ssahin.net>

pkgname=glance-liberty
osseries=liberty-1
pkgver=11.0.0.0b1
pkgrel=1
arch=(any)
url="https://launchpad.net/glance"
license=('Apache')
depends=('python2-pbr>=0.11'
         'python2-pbr<2.0'
         'python2-greenlet>=0.3.2'
         'python2-sqlalchemy-openstack'
         'python2-anyjson>=0.3.3'
         'python2-eventlet>=0.17.3'
         'python2-paste-deploy>=1.5.0'
         'python2-routes>=1.12.3'
         'python2-webob>=1.2.3'
         'python2-migrate-openstack'
         'python2-httplib2>=0.7.5'
         'python2-kombu>=3.0.7'
         'python2-crypto>=2.6'
         'python2-iso8601>=0.1.9'
         'python2-oslo-config-liberty'
         'python2-oslo-concurrency-liberty'
         'python2-oslo-context-liberty'
         'python2-oslo-service-liberty'
         'python2-oslo-utils-liberty'
         'python2-stevedore-openstack'
         'python2-taskflow-liberty'
         'python2-keystonemiddleware-liberty'
         'python2-wsme>=0.6'
         'python2-posix_ipc'
         'python2-swiftclient-liberty'
         'python2-oslo-vmware-liberty'
         'python2-paste'
         'python2-jsonschema>=2.0.0'
         'python2-jsonschema<3.0.0'
         'python2-keystoneclient-liberty'
         'python2-pyopenssl>=0.11'
         'python2-six>=1.9.0'
         'python2-oslo-db-liberty'
         'python2-oslo-i18n-liberty'
         'python2-oslo-log-liberty'
         'python2-oslo-messaging-liberty'
         'python2-oslo-policy-liberty'
         'python2-oslo-serialization-liberty'
         'python2-retrying>=1.2.3'
         'python2-osprofiler>=0.3.0'
         'python2-glance-store-liberty'
         'python2-semantic-version>=2.3.1'
         )
makedepends=(python2-setuptools)
pkgdesc="OpenStack image registry and delivery service"
source=("https://launchpad.net/glance/liberty/${osseries}/+download/glance-${pkgver}.tar.gz"
        "glance-api.service"
        "glance-registry.service")
md5sums=('69f39de130c23aba5d339214403088a3'
         '264d67ff4e694e47029bfe9f718c29b7'
         'ca8fc3b6e84f6deb69e298abba883539')

prepare() {
    find glance-$pkgver -type f -exec sed -ri 's:^#!/usr/bin/(env )?python$:&2:' '{}' \;
}

build() {
    cd glance-$pkgver/
    python2 setup.py build
}

package() {
    cd glance-$pkgver/
    python2 setup.py install --root="$pkgdir" --optimize=1
    install -d "$pkgdir"/etc/;install -d "$pkgdir"/var/log/glance/;install -d "$pkgdir"/usr/lib/systemd/system/;install -Dm644 ${startdir}/glance-api.service "$pkgdir"/usr/lib/systemd/system/glance-api.service;install -Dm644 ${startdir}/glance-registry.service "$pkgdir"/usr/lib/systemd/system/glance-registry.service
    cp -r etc/ "$pkgdir"/etc/glance/
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/glance/LICENSE
}
