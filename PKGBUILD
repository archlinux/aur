#Maintainer: David McInnis <davidm@eagles.ewu.edu>

pkgbase=('python-parameterized')
pkgname=('python-parameterized' 'python2-parameterized')
_module='parameterized'
pkgver='0.6.1'
pkgrel=1
pkgdesc="Parameterized testing with any Python test framework"
url="https://github.com/wolever/parameterized"
depends=('python' 'python2')
makedepends=('python-setuptools' 'python2-setuptools')
checkdepends=('python-nose' 'python2-nose')
conflicts=('python-nose-parameterized')
replaces=('python-nose-parameterized')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/p/parameterized/parameterized-${pkgver}.tar.gz")
sha256sums=('caf58e717097735de0d7e15386a46ffa5ce25bb6a13a43716a8854a8d34841e2')

prepare() {
  cd "$srcdir/"
  cp -a "${srcdir}/${_module}-${pkgver}" "${srcdir}/${_module}-${pkgver}-py2"
}

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
    
    cd "${srcdir}/${_module}-${pkgver}-py2"
    python2 setup.py build
}

check(){
    cd "${srcdir}/${_module}-${pkgver}"
    nosetests
    cd "${srcdir}/${_module}-${pkgver}-py2"
    nosetests2
}

package_python-parameterized() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}

package_python2-parameterized() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}-py2"
    python2 setup.py install --root="${pkgdir}" --optimize=1
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
