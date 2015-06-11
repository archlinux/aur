# Maintainer: Erhan SAHIN <erhan@ssahin.net>

pkgname=nova-icehouse
_pkgname=nova
_relname=icehouse
pkgver=2014.1.3
pkgrel=1
pkgdesc="OpenStack cloud computing fabric controller"
arch=(any)
install=nova.install
url=https://launchpad.net/nova
license=(custom)
depends=('python2-pbr>=0.6'
         'python2-pbr<1.0'
         'python2-sqlalchemy>=0.7.8'
         'python2-sqlalchemy<0.9.99'
         'python2-amqplib>=0.6.1'
         'python2-anyjson>=0.3.3'
         'python2-argparse'
         'python2-boto>=2.12.0'
         'python2-eventlet>=0.13.0'
         'python2-jinja'
         'python2-kombu>=2.4.8'
         'python2-lxml>=2.3'
         'python2-routes>=1.12.3'
         'python2-webob>=1.2.3'
         'python2-greenlet>=0.3.2'
         'python2-paste-deploy>=1.5.0'
         'python2-paste'
         'python2-migrate-icehouse>=0.8.2'
         'python2-netaddr>=0.7.6'
         'python2-suds>=0.4'
         'python2-paramiko>=1.9.0'
         'python2-pyasn1'
         'python2-babel>=1.3'
         'python2-iso8601>=0.1.9'
         'python2-jsonschema>=2.0.0'
         'python2-jsonschema<3.0.0'
         'python2-cinderclient>=1.0.6'
         'python2-neutronclient>=2.3.4'
         'python2-neutronclient<3.0'
         'python2-glanceclient-openstack>=0.9.0'
         'python2-keystoneclient>=0.7.0'
         'python2-six>=1.6.0'
         'python2-stevedore>=0.14'
         'websockify-openstack>=0.5.1'
         'websockify-openstack<0.6'
         'python2-wsgiref>=0.1.2'
         'python2-oslo-config>=1.2.0'
         'python2-oslo-rootwrap'
         'python2-pycadf>=0.4.1'
         'python2-oslo-messaging>=1.3.0'
         'python2-carrot'
         'python2-cheetah'
         'python2-daemon'
         'python2-feedparser'
         'python2-gflags'
         'python2-lockfile'
         'python2-novaclient')
makedepends=(python2-setuptools)
source=("https://launchpad.net/nova/$_relname/$pkgver/+download/$_pkgname-$pkgver.tar.gz"
        "nova-api.service"
        "nova-cert.service"
        "nova-conductor.service"
        "nova-consoleauth.service"
        "nova-novncproxy.service"
        "nova-scheduler.service"
        "nova_sudoers"
        "nova-compute.conf"
        "nova-compute.service")
md5sums=('5f17b2d997371a56f82d05c2bab4954a'
         '8e400161328001ff89cc7ea59a84cfe2'
         '6e11f7245b10e39ed024a512108ae95c'
         '5e8770c7b964fc82dbb6758688088ad9'
         'ffd28c32938c99232a8a3de5ab95f6d5'
         '52d6eadb4150289497b44a82552bfab0'
         '390100b8adaf92df13f660cc451b2f01'
         'b166058b5c25d0d7851adf30c2356691'
         'c15ecc2982a90c2a86c110833c6c4bbc'
         'e16fbaef08ba9fc08a726425d0c79429')

build() {
    cd ${_pkgname}-${pkgver}/
    python2 setup.py build
}

package() {
    cd ${_pkgname}-${pkgver}/
    python2 setup.py install --root="${pkgdir}" --optimize=1

    install -d "${pkgdir}"/etc/
    cp -r etc/ "${pkgdir}"/
    install -d -m 0750 "${pkgdir}"/etc/sudoers.d/
    cp ${srcdir}/nova_sudoers "${pkgdir}"/etc/sudoers.d/nova_sudoers
    cp ${srcdir}/nova-compute.conf "${pkgdir}"/etc/nova/nova-compute.conf
    install -d -m 0770 ${pkgdir}/var/lib/nova/
    install -d -m 0770 ${pkgdir}/var/log/nova/
    install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${_pkgname}/LICENSE
    install -D -m 644 ${srcdir}/nova-api.service ${pkgdir}/usr/lib/systemd/system/nova-api.service
    install -D -m 644 ${srcdir}/nova-cert.service ${pkgdir}/usr/lib/systemd/system/nova-cert.service
    install -D -m 644 ${srcdir}/nova-conductor.service ${pkgdir}/usr/lib/systemd/system/nova-conductor.service
    install -D -m 644 ${srcdir}/nova-consoleauth.service ${pkgdir}/usr/lib/systemd/system/nova-consoleauth.service
    install -D -m 644 ${srcdir}/nova-novncproxy.service ${pkgdir}/usr/lib/systemd/system/nova-novncproxy.service
    install -D -m 644 ${srcdir}/nova-scheduler.service ${pkgdir}/usr/lib/systemd/system/nova-scheduler.service
    install -D -m 644 ${srcdir}/nova-compute.service ${pkgdir}/usr/lib/systemd/system/nova-compute.service
}
