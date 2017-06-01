# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgbase=('python-osrf_pycommon')
pkgname=('python-osrf_pycommon' 'python2-osrf_pycommon')
_module='osrf_pycommon'
pkgver='0.1.2'
pkgrel=3
pkgdesc="Commonly needed Python modules, used by Python software developed at OSRF"
url="http://osrf-pycommon.readthedocs.org/"
depends=()
makedepends=('python-setuptools' 'python2-setuptools')
license=('Apache')
arch=('any')
source=("https://github.com/osrf/osrf_pycommon/archive/${pkgver}.tar.gz")
md5sums=('562020a22797338d834a549c4c291ece')

prepare() {
    cp -a "${srcdir}/${_module}-${pkgver}"{,-python2}
}

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build

    cd "${srcdir}/${_module}-${pkgver}-python2"
    python2 setup.py build
}

package_python-osrf_pycommon() {
    depends+=('python')
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

package_python2-osrf_pycommon() {
    depends+=('python2' 'python2-trollius')
    conflicts=('python2-osrf-pycommon')
    replaces=('python2-osrf-pycommon')
    cd "${srcdir}/${_module}-${pkgver}-python2"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
