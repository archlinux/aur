# Maintainer: Grey Christoforo <first name at last name dot net>

pkgbase=python-mss
pkgname=('python-mss' 'python2-mss')
_module='mss'
pkgver=3.3.2
pkgrel=1
pkgdesc="An ultra fast cross-platform multiple screenshots module in pure python using ctypes."
url="https://github.com/BoboTiG/python-mss"
depends=()
makedepends=('python-setuptools' 'python2-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/m/mss/mss-${pkgver}.tar.gz")
md5sums=('e9bc7dbd2551b56f4baeb58f5093d092')

prepare() {
    cp -a "${srcdir}/${_module}-${pkgver}"{,-python2}
}

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build

    cd "${srcdir}/${_module}-${pkgver}-python2"
    python2 setup.py build
}

package_python-mss() {
    depends+=('python')
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

package_python2-mss() {
    depends+=('python2')
    cd "${srcdir}/${_module}-${pkgver}-python2"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
