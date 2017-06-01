# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgbase=('python-rosdistro')
pkgname=('python-rosdistro' 'python2-rosdistro')
_module='rosdistro'
pkgver='0.6.2'
pkgrel=1
pkgdesc="A tool to work with rosdistro files"
url="http://wiki.ros.org/rosdistro"
depends=()
makedepends=('python-setuptools' 'python2-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/r/rosdistro/rosdistro-${pkgver}.tar.gz")
md5sums=('5ef1af890d0fc92c6920c4c86ef498cd')

prepare() {
    cp -a "${srcdir}/${_module}-${pkgver}"{,-python2}
}

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build

    cd "${srcdir}/${_module}-${pkgver}-python2"
    python2 setup.py build
}

package_python-rosdistro() {
    depends+=('python' 'python-catkin_pkg' 'python-rospkg' 'python-yaml')
    conflicts=('python2-rosdistro')
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

package_python2-rosdistro() {
    depends+=('python2' 'python2-catkin_pkg' 'python2-rospkg' 'python2-yaml')
    conflicts=('python-rosdistro')
    cd "${srcdir}/${_module}-${pkgver}-python2"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
