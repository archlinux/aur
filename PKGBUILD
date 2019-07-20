pkgname=python-pylgbst
_module=pylgbst
pkgver=1.0.1
pkgrel=1
pkgdesc="LEGO Boost python module"
url="https://github.com/undera/pylgbst"
depends=('python' 'python-pygatt' 'bluez-utils-compat')
makedepends=('python-setuptools')
license=('APACHE')
arch=('any')
source=("$pkgname-$pkgver.tar.gz::https://github.com/undera/pylgbst/archive/$pkgver.tar.gz")
sha256sums=('06f542d6381d335c49798bec8b47186d074a2848421fbf1d49cfc1b356804f44')

# sudo setcap 'cap_net_raw,cap_net_admin+eip' /usr/bin/hcitool
# required to work without root permissions

prepare() {
    cd "${srcdir}/${_module}-${pkgver}"
    # do not reset adapter, so root not required
    sed -i 's|adapter.start()|adapter.start(False)|' pylgbst/comms/cpygatt.py
}

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
