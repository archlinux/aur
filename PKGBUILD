# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgbase=('python-rospkg')
pkgname=('python-rospkg' 'python2-rospkg')
_module='rospkg'
pkgver='1.1.1'
pkgrel=1
pkgdesc="ROS package library"
url="http://wiki.ros.org/rospkg"
depends=()
makedepends=('python-setuptools' 'python2-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/r/rospkg/rospkg-${pkgver}.tar.gz")
md5sums=('ae63e738cc85298ebee8e0b1b78e9b56')

prepare() {
    cp -a "${srcdir}/${_module}-${pkgver}"{,-python2}
}

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build

    cd "${srcdir}/${_module}-${pkgver}-python2"
    python2 setup.py build
}

package_python-rospkg() {
    depends+=('python' 'python-yaml')
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

package_python2-rospkg() {
    depends+=('python2' 'python2-yaml')
    cd "${srcdir}/${_module}-${pkgver}-python2"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
