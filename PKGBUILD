# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgbase=('python-rosinstall_generator')
pkgname=('python-rosinstall_generator' 'python2-rosinstall_generator')
_module='rosinstall_generator'
pkgver='0.1.13'
pkgrel=1
pkgdesc="A tool to generator rosinstall files"
url="http://wiki.ros.org/rosinstall_generator"
depends=()
makedepends=('python-setuptools' 'python2-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/r/rosinstall_generator/rosinstall_generator-${pkgver}.tar.gz")
md5sums=('605826dbfea6a0e802d3b96d6f848548')

prepare() {
    cp -a "${srcdir}/${_module}-${pkgver}"{,-python2}
}

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build

    cd "${srcdir}/${_module}-${pkgver}-python2"
    python2 setup.py build
}

package_python-rosinstall_generator() {
    depends+=('python' 'python-argparse' 'python-catkin_pkg' 'python-rosdistro' 'python-rospkg' 'python-yaml')
    conflicts=('python2-rosinstall_generator')
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

package_python2-rosinstall_generator() {
    depends+=('python2' 'python2-argparse' 'python2-catkin_pkg' 'python2-rosdistro' 'python2-rospkg' 'python2-yaml')
    conflicts=('python-rosinstall_generator')
    cd "${srcdir}/${_module}-${pkgver}-python2"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
