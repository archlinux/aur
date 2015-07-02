# Maintainer: Erhan SAHIN < erhan@ssahin.net >

pkgname=("python2-keystoneclient-liberty")
pkgver="1.6.0"
pkgrel="1"
pkgdesc="Client Library for OpenStack Identity"
arch=("any")
url="https://launchpad.net/python-keystoneclient"
depends=("python2-pbr>=0.11"
         "python2-argparse"
         "python2-babel>=1.3"
         "python2-iso8601>=0.1.9"
         "python2-netaddr>=0.7.12"
         "python2-oslo-config-liberty"
         "python2-oslo-i18n-liberty"
         "python2-oslo-serialization-liberty"
         "python2-oslo-utils-liberty"
         "python2-prettytable>=0.7"
         "python2-prettytable<0.8"
         "python2-requests>=2.5.0"
         "python2-six>=1.9.0"
         "python2-stevedore-openstack>=1.3.0")
makedepends=("python2-pip"
             "python2-setuptools")
provides=('python2-keystoneclient')
license=("Apache")
source=("https://pypi.python.org/packages/source/p/python-keystoneclient/python-keystoneclient-${pkgver}.tar.gz")
sha256sums=('45ac3b13b8b63ab62cb3fbfcaf46a2241d8053dfe17961db911c45c1f23d06ff')

prepare() {
    cd "${srcdir}/python-keystoneclient-${pkgver}"
    sed -ri '/argparse|pbr/d' requirements.txt
}

package_python2-keystoneclient-liberty() {
    cd "${srcdir}/python-keystoneclient-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
    install -Dm644 "tools/keystone.bash_completion" "${pkgdir}/usr/share/bash-completion/completions/keystone"
}
