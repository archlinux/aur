# Maintainer: Maciej Dems <macdems@gmail.com>
pkgbase='python-pockets'
pkgname=('python-pockets' 'python2-pockets')
_module='pockets'
pkgver='0.9.1'
pkgrel=1
pkgdesc="A collection of helpful Python tools!"
url="http://pockets.readthedocs.org"
makedepends=('python-setuptools' 'python2-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('9320f1a3c6f7a9133fe3b571f283bcf3353cd70249025ae8d618e40e9f7e92b3')

prepare() {
    cp -a "${srcdir}/${_module}-${pkgver}"{,-python2}
}

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build

    cd "${srcdir}/${_module}-${pkgver}-python2"
    python2 setup.py build
}

package_python-pockets() {
    depends=('python' 'python-six')
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

package_python2-pockets() {
    depends=('python2' 'python2-six')
    cd "${srcdir}/${_module}-${pkgver}-python2"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
