pkgbase=python-pcodedmp
pkgname=('python-pcodedmp' 'python2-pcodedmp')
_module='pcodedmp'
pkgver='1.2.6'
pkgrel=1
pkgdesc="A VBA p-code disassembler"
url="https://github.com/bontchev/pcodedmp"
depends=()
makedepends=('python-setuptools' 'python2-setuptools')
license=('GPLv3')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/p/pcodedmp/pcodedmp-${pkgver}.tar.gz")
md5sums=('9b9b4e85203a6dd19757793bf2d87af4')

prepare() {
    cp -a "${srcdir}/${_module}-${pkgver}"{,-python2}
}

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build

    cd "${srcdir}/${_module}-${pkgver}-python2"
    python2 setup.py build
}

package_python-pcodedmp() {
    depends+=('python' 'python-oletools')
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

package_python2-pcodedmp() {
    depends+=('python2' 'python2-oletools')
    cd "${srcdir}/${_module}-${pkgver}-python2"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
