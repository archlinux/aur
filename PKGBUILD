pkgbase='pip2pkgbuild'
pkgname=('pip2pkgbuild' 'python2-pip2pkgbuild')
_module='pip2pkgbuild'
pkgver='0.2.6'
pkgrel=1
pkgdesc="Generate PKGBUILD file for a Python module from PyPi"
url="https://github.com/wenLiangcan/pip2pkgbuild"
depends=()
makedepends=('python-setuptools' 'python2-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('5247ff4ff7c672910733a0b06619bd0f7efaa4c18b619646f902e5e19d07811b')

prepare() {
    cp -a "${srcdir}/${_module}-${pkgver}"{,-python2}
}

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build

    cd "${srcdir}/${_module}-${pkgver}-python2"
    python2 setup.py build
}

package_pip2pkgbuild() {
    depends+=('python' 'python-pip')
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

package_python2-pip2pkgbuild() {
    depends+=('python2' 'python2-pip')
    cd "${srcdir}/${_module}-${pkgver}-python2"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    mv "${pkgdir}/usr/bin/pip2pkgbuild"{,2}
}
