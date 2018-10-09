# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgbase='python-catkin_tools'
pkgname=('python-catkin_tools')
_module='catkin_tools'
pkgver='0.4.4'
pkgrel=4
pkgdesc="Command line tools for working with catkin."
url="http://catkin-tools.readthedocs.org/"
depends=('python' 'python-catkin_pkg' 'python-osrf_pycommon' 'python-yaml')
provides=('python-catkin-tools')
conflicts=('python2-catkin_tools' 'python-catkin-tools')
makedepends=('python-setuptools')
license=('Apache')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/c/catkin_tools/catkin_tools-${pkgver}.tar.gz"
        "jobserver-make-4.2.patch"
        "execution-controllers-python3.patch"
        "no-trollius.patch")
md5sums=('5150b435c79bd952a24dc8c67cc091bc'
        'eb43f43e0d65a7c84753f187b44050ac'
        '85f3008e2ca09a7aba65c3e7c58e740e'
        'efec5180e60675e836dbbb8e8ccd2d19')

prepare() {
    cd "${srcdir}/${_module}-${pkgver}"
    patch -p1 -i "${srcdir}/jobserver-make-4.2.patch"
    patch -p1 -i "${srcdir}/execution-controllers-python3.patch"
    patch -p1 -i "${srcdir}/no-trollius.patch"
}

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
