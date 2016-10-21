# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgbase=('python-flake8-polyfill')
pkgname=('python-flake8-polyfill' 'python2-flake8-polyfill')
_module='flake8-polyfill'
pkgver='1.0.1'
pkgrel=1
pkgdesc="Polyfill package for Flake8 plugins"
url="https://gitlab.com/pycqa/flake8-polyfill"
depends=()
makedepends=('python-setuptools' 'python2-setuptools')
license=('MIT')
arch=('any')
source=("https://pypi.python.org/packages/71/6e/dd7e0f0ddf146213d0cc0b963b3d4c6434823ebe3992c29b523182bbf785/flake8-polyfill-${pkgver}.tar.gz")
md5sums=('92aa008899021c8c7c3a9db2578164da')

prepare() {
    cp -a "${srcdir}/${_module}-${pkgver}"{,-python2}
}

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build

    cd "${srcdir}/${_module}-${pkgver}-python2"
    python2 setup.py build
}

package_python-flake8-polyfill() {
    depends+=('flake8')
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

package_python2-flake8-polyfill() {
    depends+=('python2-flake8')
    cd "${srcdir}/${_module}-${pkgver}-python2"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
