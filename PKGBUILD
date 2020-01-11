pkgbase=python-titlecase
pkgname=('python-titlecase' 'python2-titlecase')
_module='titlecase'
pkgver='0.12.0'
pkgrel=1
pkgdesc="Python Port of John Gruber's titlecase.pl"
url="https://github.com/ppannuto/python-titlecase"
depends=()
makedepends=('python-setuptools' 'python2-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/t/titlecase/titlecase-${pkgver}.tar.gz")
md5sums=('238c9655b9943801b1816046dcedb00e')

prepare() {
    cp -a "${srcdir}/${_module}-${pkgver}"{,-python2}
}

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build

    cd "${srcdir}/${_module}-${pkgver}-python2"
    python2 setup.py build
}

package_python-titlecase() {
    depends+=('python')
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

package_python2-titlecase() {
    depends+=('python2')
    cd "${srcdir}/${_module}-${pkgver}-python2"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
