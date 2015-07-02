# Maintainer: Erhan SAHIN <erhan@ssahin.net>

pkgname=nova-liberty
osseries=liberty-1
pkgver=12.0.0.0b1
pkgrel=1
pkgdesc="OpenStack cloud computing fabric controller"
arch=(any)
install=nova.install
url=https://launchpad.net/nova
license=(custom)
depends=('python2-pbr>=0.11'
         'python2-pbr<2.0'
         'python2-sqlalchemy-openstack'
         'python2-boto>=2.32.1'
         'python2-decorator>=3.4.0'
         'python2-eventlet>=0.17.3'
         'python2-jinja>=2.6'
         'python2-keystonemiddleware-liberty'
         'python2-lxml>=2.3'
         'python2-routes>=1.12.3'
         'python2-webob>=1.2.3'
         'python2-greenlet>=0.3.2'
         'python2-paste-deploy>=1.5.0'
         'python2-paste'
         'python2-migrate-openstack'
         'python2-netaddr>=0.7.12'
         'python2-netifaces>=0.10.4'
         'python2-paramiko>=1.13.0'
         'python2-pyasn1'
         'python2-babel>=1.3'
         'python2-iso8601>=0.1.9'
         'python2-jsonschema>=2.0.0'
         'python2-jsonschema<3.0.0'
         'python2-cinderclient-liberty'
         'python2-keystoneclient-liberty'
         'python2-neutronclient-liberty'
         'python2-glanceclient-liberty'
         'python2-requests>=2.5.2'
         'python2-six>=1.9.0'
         'python2-stevedore-openstack'
         'python2-setuptools'
         'websockify>=0.6.0'
         'websockify<0.7'
         'python2-oslo-concurrency-liberty'
         'python2-oslo-config-liberty'
         'python2-oslo-context-liberty'
         'python2-oslo-log-liberty'
         'python2-oslo-serialization-liberty'
         'python2-oslo-utils-liberty'
         'python2-oslo-db-liberty'
         'python2-oslo-rootwrap-liberty'
         'python2-oslo-messaging-liberty'
         'python2-oslo-i18n-liberty'
         'python2-rfc3986>=0.2.0'
         'python2-oslo-middleware-liberty'
         'python2-psutil-liberty'
         'python2-oslo-versionedobjects-liberty'
         'python2-alembic>=0.7.2')
makedepends=(python2-setuptools)
source=("https://launchpad.net/nova/liberty/$osseries/+download/nova-$pkgver.tar.gz"
        "nova-api.service"
        "nova-cert.service"
        "nova-conductor.service"
        "nova-consoleauth.service"
        "nova-novncproxy.service"
        "nova-scheduler.service"
        "nova_sudoers"
        "nova-compute.conf"
        "nova-compute.service")
md5sums=('19e83fbb542cdcd4b464c3d2984e102e'
         '5345f34af3bcc5b5b142bc1545821045'
         '85d6229bd6336a074d6b9f284bab560d'
         'afff9d985f64b2d0403574f73fde7fdf'
         '37d1fd1dd4724531d583a603a0185653'
         '43d3516a9b1a53851bbcb0dcee0269d4'
         '90d17720783c89a1d2d113e560bafab8'
         'b166058b5c25d0d7851adf30c2356691'
         'c15ecc2982a90c2a86c110833c6c4bbc'
         'e16fbaef08ba9fc08a726425d0c79429')

build() {
    cd nova-${pkgver}/
    python2 setup.py build
}

package() {
    cd nova-${pkgver}/
    python2 setup.py install --root="${pkgdir}" --optimize=1

    install -d "${pkgdir}"/etc/
    cp -r etc/ "${pkgdir}"/
    install -d -m 0750 "${pkgdir}"/etc/sudoers.d/
    cp ${srcdir}/nova_sudoers "${pkgdir}"/etc/sudoers.d/nova_sudoers
    cp ${srcdir}/nova-compute.conf "${pkgdir}"/etc/nova/nova-compute.conf
    install -d -m 0770 ${pkgdir}/var/lib/nova/
    install -d -m 0770 ${pkgdir}/var/log/nova/
    install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/nova/LICENSE
    install -D -m 644 ${srcdir}/nova-api.service ${pkgdir}/usr/lib/systemd/system/nova-api.service
    install -D -m 644 ${srcdir}/nova-cert.service ${pkgdir}/usr/lib/systemd/system/nova-cert.service
    install -D -m 644 ${srcdir}/nova-conductor.service ${pkgdir}/usr/lib/systemd/system/nova-conductor.service
    install -D -m 644 ${srcdir}/nova-consoleauth.service ${pkgdir}/usr/lib/systemd/system/nova-consoleauth.service
    install -D -m 644 ${srcdir}/nova-novncproxy.service ${pkgdir}/usr/lib/systemd/system/nova-novncproxy.service
    install -D -m 644 ${srcdir}/nova-scheduler.service ${pkgdir}/usr/lib/systemd/system/nova-scheduler.service
    install -D -m 644 ${srcdir}/nova-compute.service ${pkgdir}/usr/lib/systemd/system/nova-compute.service
}
