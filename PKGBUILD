# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgbase=('python-rosinstall')
pkgname=('python-rosinstall' 'python2-rosinstall')
_module='rosinstall'
pkgver='0.7.8'
pkgrel=2
pkgdesc="The installer for ROS"
url="http://wiki.ros.org/rosinstall"
depends=()
makedepends=('python-setuptools' 'python2-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/r/rosinstall/rosinstall-${pkgver}.tar.gz")
md5sums=('b52ea80b199efdb94e35229eb427965f')

prepare() {
    cp -a "${srcdir}/${_module}-${pkgver}"{,-python2}
}

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build

    cd "${srcdir}/${_module}-${pkgver}-python2"
    python2 setup.py build
}

package_python-rosinstall() {
    depends+=('python' 'python-catkin_pkg' 'python-rosdistro' 'python-vcstools' 'python-wstool' 'python-yaml')
    conflicts=('python2-rosinstall')
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

package_python2-rosinstall() {
    depends+=('python2' 'python2-catkin_pkg' 'python2-rosdistro' 'python2-vcstools' 'python2-wstool' 'python2-yaml')
    conflicts=('python-rosinstall')
    cd "${srcdir}/${_module}-${pkgver}-python2"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
