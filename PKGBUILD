# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgbase=('python-catkin_pkg')
pkgname=('python-catkin_pkg' 'python2-catkin_pkg')
_module='catkin_pkg'
pkgver='0.3.4'
pkgrel=1
pkgdesc="catkin package library"
url="http://wiki.ros.org/catkin_pkg"
depends=()
makedepends=('python-setuptools' 'python2-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/c/catkin_pkg/catkin_pkg-${pkgver}.tar.gz")
md5sums=('0d121b798a47d740745b17528fe6b0cd')

prepare() {
    cp -a "${srcdir}/${_module}-${pkgver}"{,-python2}
}

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build

    cd "${srcdir}/${_module}-${pkgver}-python2"
    python2 setup.py build
}

package_python-catkin_pkg() {
    depends+=('python' 'python-argparse' 'python-dateutil' 'python-docutils')
    conflicts=('python-catkin-pkg' 'python2-catkin_pkg')
    replaces=('python-catkin-pkg')
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

package_python2-catkin_pkg() {
    depends+=('python2' 'python2-argparse' 'python2-dateutil' 'python2-docutils')
    conflicts=('python2-catkin-pkg' 'python-catkin_pkg')
    replaces=('python2-catkin-pkg')
    cd "${srcdir}/${_module}-${pkgver}-python2"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
