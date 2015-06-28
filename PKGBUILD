# Maintainer: Erhan SAHIN < erhan@ssahin.net >

pkgname=("python2-keystoneclient-kilo")
pkgver="1.3.1"
pkgrel="2"
pkgdesc="Client Library for OpenStack Identity"
arch=("any")
url="https://launchpad.net/python-keystoneclient"
depends=("python2-babel>=1.3"
             "python2-iso8601>=0.1.9"
             "python2-netaddr>=0.7.12"
             "python2-oslo-config-kilo"
             "python2-oslo-i18n-kilo>=1.5.0"
             "python2-oslo-serialization-kilo>=1.4.0"
             "python2-oslo-utils-kilo>=1.4.0"
             "python2-prettytable>=0.7"
             "python2-requests>=2.2.0"
             "python2-six>=1.9.0"
             "python2-stevedore-kilo>=1.3.0"
             "python2-stevedore-kilo<1.4.0")
makedepends=("python2-pbr>=0.6"
             "python2-pip"
             "python2-setuptools")
provides=('python2-keystoneclient')
license=("Apache")
source=("https://pypi.python.org/packages/source/p/python-keystoneclient/python-keystoneclient-${pkgver}.tar.gz")
sha256sums=('8a421dbdf01251119164bf6baa0ef78b261e5dd4d3508748e47b77d7652e7e92')

prepare() {
    cd "${srcdir}/python-keystoneclient-${pkgver}"
    sed -ri '/argparse|pbr/d' requirements.txt
}

package_python2-keystoneclient-kilo() {
    cd "${srcdir}/python-keystoneclient-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
    install -Dm644 "tools/keystone.bash_completion" "${pkgdir}/usr/share/bash-completion/completions/keystone"
}
