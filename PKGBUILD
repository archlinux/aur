# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgbase=('python2-catkin_tools')
pkgname=('python2-catkin_tools')
_module='catkin_tools'
pkgver='0.4.4'
pkgrel=3
pkgdesc="Command line tools for working with catkin."
url="http://catkin-tools.readthedocs.org/"
depends=('python2' 'python2-catkin_pkg' 'python2-osrf_pycommon' 'python2-trollius' 'python2-yaml')
provides=('python2-catkin-tools')
conflicts=('python-catkin_tools' 'python2-catkin-tools')
makedepends=('python2-setuptools')
license=('Apache')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/c/catkin_tools/catkin_tools-${pkgver}.tar.gz"
        "jobserver-make-4.2.patch")
md5sums=('5150b435c79bd952a24dc8c67cc091bc'
         'eb43f43e0d65a7c84753f187b44050ac')

prepare() {
    cd "${srcdir}/${_module}-${pkgver}"
    patch -p1 -i "${srcdir}/jobserver-make-4.2.patch"
}

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
