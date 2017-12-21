# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgbase=('python-catkin_tools')
pkgname=('python-catkin_tools')
_module='catkin_tools'
pkgver='0.4.4'
pkgrel=3
pkgdesc="Command line tools for working with catkin."
url="http://catkin-tools.readthedocs.org/"
depends=('python' 'python-catkin_pkg' 'python-osrf_pycommon' 'python-trollius' 'python-yaml')
provides=('python-catkin-tools')
conflicts=('python2-catkin_tools' 'python-catkin-tools')
makedepends=('python-setuptools')
license=('Apache')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/c/catkin_tools/catkin_tools-${pkgver}.tar.gz"
        "jobserver-make-4.2.patch"
        "execution-controllers-python3.patch"
        "trollius-error-on-exit-python3.patch")
md5sums=('5150b435c79bd952a24dc8c67cc091bc'
         'eb43f43e0d65a7c84753f187b44050ac'
         '85f3008e2ca09a7aba65c3e7c58e740e'
         'b1338207d104ece20ed99e5146585e87')

prepare() {
    cd "${srcdir}/${_module}-${pkgver}"
    patch -p1 -i "${srcdir}/jobserver-make-4.2.patch"
    patch -p1 -i "${srcdir}/execution-controllers-python3.patch"
    patch -p1 -i "${srcdir}/trollius-error-on-exit-python3.patch"
}

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
