# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgbase=('python-rosdep')
pkgname=('python-rosdep' 'python2-rosdep')
_module='rosdep'
pkgver='0.11.5'
pkgrel=1
pkgdesc="rosdep package manager abstrction tool for ROS"
url="http://wiki.ros.org/rosdep"
depends=()
makedepends=('python-setuptools' 'python2-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/r/rosdep/rosdep-${pkgver}.tar.gz")
md5sums=('2c5669bc5cafcb1df8cd21ce14844cc4')

prepare() {
    cp -a "${srcdir}/${_module}-${pkgver}"{,-python2}
}

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build

    cd "${srcdir}/${_module}-${pkgver}-python2"
    python2 setup.py build
}

package_python-rosdep() {
    depends+=('python' 'python-catkin_pkg' 'python-rosdistro' 'python-rospkg' 'python-yaml')
    conflicts=('python2-rosdep')
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

package_python2-rosdep() {
    depends+=('python2' 'python2-catkin_pkg' 'python2-rosdistro' 'python2-rospkg' 'python2-yaml')
    conflicts=('python-rosdep')
    cd "${srcdir}/${_module}-${pkgver}-python2"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
