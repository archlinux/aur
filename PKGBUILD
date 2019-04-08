# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgbase='python-catkin_tools'
pkgname=('python-catkin_tools')
_module='catkin_tools'
pkgver='0.4.5'
pkgrel=1
pkgdesc="Command line tools for working with catkin."
url="http://catkin-tools.readthedocs.org/"
depends=('python' 'python-catkin_pkg' 'python-osrf_pycommon' 'python-yaml')
provides=('python-catkin-tools')
conflicts=('python2-catkin_tools' 'python-catkin-tools')
makedepends=('python-setuptools')
license=('Apache')
arch=('any')
source=("https://files.pythonhosted.org/packages/1c/9a/d5c2cd6178dd6a66744a28e185a9a124b4284a49759b5427024f27d6afe1/catkin_tools-0.4.5.tar.gz"
        "execution-controllers-python3.patch"
        "no-trollius.patch")
md5sums=('0212ce968d1128dba7d4a615ea170546'
         '85f3008e2ca09a7aba65c3e7c58e740e'
         'fa5a864fb82b5b331cc9fbfa4f843449')

prepare() {
    cd "${srcdir}/${_module}-${pkgver}"
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
