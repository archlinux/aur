# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgbase=('python-catkin_lint')
pkgname=('python-catkin_lint' 'python2-catkin_lint')
_module='catkin_lint'
pkgver='1.4.16'
pkgrel=1
pkgdesc="Check catkin packages for common errors"
url="https://github.com/fkie/catkin_lint"
depends=()
makedepends=('python-setuptools' 'python2-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/c/catkin_lint/catkin_lint-${pkgver}.tar.gz")
md5sums=('6252b8ac505cfc0a87d0064e316db460')

prepare() {
    cp -a "${srcdir}/${_module}-${pkgver}"{,-python2}
}

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build

    cd "${srcdir}/${_module}-${pkgver}-python2"
    python2 setup.py build
}

package_python-catkin_lint() {
    depends+=('python' 'python-catkin_pkg')
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

package_python2-catkin_lint() {
    depends+=('python2' 'python2-catkin_pkg')
    cd "${srcdir}/${_module}-${pkgver}-python2"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
