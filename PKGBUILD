# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgbase=('python-wstool')
pkgname=('python-wstool' 'python2-wstool')
_module='wstool'
pkgver='0.1.13'
pkgrel=2
pkgdesc="workspace multi-SCM commands"
url="http://wiki.ros.org/wstool"
depends=()
makedepends=('python-setuptools' 'python2-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/w/wstool/wstool-${pkgver}.tar.gz")
md5sums=('7e41a0e4f92389a6b4e115c80dd5cf10')

prepare() {
    cp -a "${srcdir}/${_module}-${pkgver}"{,-python2}
}

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build

    cd "${srcdir}/${_module}-${pkgver}-python2"
    python2 setup.py build
}

package_python-wstool() {
    depends+=('python' 'python-vcstools' 'python-yaml')
    conflicts=('python2-wstool')
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

package_python2-wstool() {
    depends+=('python2' 'python2-vcstools' 'python2-yaml')
    conflicts=('python-wstool')
    cd "${srcdir}/${_module}-${pkgver}-python2"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
