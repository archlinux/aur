# Maintainer: caiye <ye dot jingchen at gmail dot com>
pkgbase=python-pynat
pkgname=(python-pynat python2-pynat)
_module='pynat'
pkgver=0.6.1
pkgrel=1
pkgdesc="Discover external IP addresses and NAT topologies using STUN."
url="https://github.com/arantonitis/pynat"
depends=()
makedepends=('python-setuptools' 'python2-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('db107c85f7c8c5368e93dbf1dff21f88cabbd30f288a0c07c699bf3cb6319e67')

prepare() {
    cp -a "${srcdir}/${_module}-${pkgver}"{,-python2}
}

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build

    cd "${srcdir}/${_module}-${pkgver}-python2"
    python2 setup.py build
}

package_python-pynat() {
    depends+=('python')
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

package_python2-pynat() {
    depends+=('python2')
    cd "${srcdir}/${_module}-${pkgver}-python2"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
