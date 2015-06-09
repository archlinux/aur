# Maintainer: Erhan SAHIN <erhan@ssahin.net>

pkgname=nova-kilo
pkgver=2015.1.0
pkgrel=1
pkgdesc="OpenStack cloud computing fabric controller"
arch=(any)
install=nova.install
url=https://launchpad.net/nova
license=(custom)
depends=('python2-pbr>=0.6'
         'python2-pbr<1.0'
         'python2-sqlalchemy-kilo'
         'python2-boto>=2.32.1'
         'python2-decorator>=3.4.0'
         'python2-eventlet>=0.16.1'
         'python2-jinja>=2.6'
         'python2-keystonemiddleware-kilo'
         'python2-lxml>=2.3'
         'python2-routes>=1.12.3'
         'python2-webob>=1.2.3'
         'python2-greenlet>=0.3.2'
         'python2-paste-deploy>=1.5.0'
         'python2-paste'
         'python2-migrate-kilo'
         'python2-netaddr>=0.7.12'
         'python2-paramiko>=1.13.0'
         'python2-pyasn1'
         'python2-babel>=1.3'
         'python2-iso8601>=0.1.9'
         'python2-jsonschema>=2.0.0'
         'python2-jsonschema<3.0.0'
         'python2-cinderclient-kilo'
         'python2-neutronclient-kilo'
         'python2-glanceclient>=0.15.0'
         'python2-six>=1.9.0'
         'python2-stevedore-kilo'
         'websockify>=0.6.0'
         'websockify<0.7'
         'python2-oslo-concurrency-kilo'
         'python2-oslo-config>=1.9.3'
         'python2-oslo-config<1.10.0'
         'python2-oslo-context-kilo'
         'python2-oslo-log-kilo'
         'python2-oslo-serialization-kilo'
         'python2-oslo-utils-kilo'
         'python2-oslo-db-kilo'
         'python2-oslo-rootwrap-kilo'
         'python2-oslo-messaging-kilo'
         'python2-oslo-i18n-kilo'
         'python2-rfc3986>=0.2.0'
         'python2-oslo-middleware-kilo'
         'python2-psutil-kilo')
makedepends=(python2-setuptools)
source=("https://launchpad.net/nova/kilo/$pkgver/+download/nova-$pkgver.tar.gz"
        "nova-api.service"
        "nova-cert.service"
        "nova-conductor.service"
        "nova-consoleauth.service"
        "nova-novncproxy.service"
        "nova-scheduler.service"
        "nova_sudoers"
        "nova-compute.conf"
        "nova-compute.service")
md5sums=('a60450bbf1ea0f124c0605a1bd7c718c'
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
