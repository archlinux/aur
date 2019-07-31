# Maintainer: Jose Riha <jose1711 gmail com>
# Co-contributor: Andrea Pascal <andrea@anodium.net>

pkgbase=python-pygatt
pkgname=(python-pygatt python2-pygatt)
_module=pygatt
pkgver=4.0.3
pkgrel=2
pkgdesc="Python Bluetooth LE (Low Energy) and GATT Library"
url="https://github.com/peplin/pygatt"
depends=('python-enum-compat')
license=('APACHE')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('b1db8e294fc9c68f4dee66e7e2bdde3240c18c2495237059b83f3e7ca9897466')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

check() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py check -m -s
    python2 setup.py check -m -s
}

package_python-pygatt() {
    depends+=('python' 'python-pexpect' 'python-pyserial')
    makedepends=('python-setuptools')

    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

package_python2-pygatt() {
    depends+=('python2' 'python2-pexpect' 'python2-pyserial')
    makedepends=('python2-setuptools')

    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
