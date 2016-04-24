#Maintainer: David McInnis <davidm@eagles.ewu.edu>

pkgbase=('python-nose-parameterized')
pkgname=('python-nose-parameterized' 'python2-nose-parameterized')
_module='nose-parameterized'
pkgver='0.5.0'
pkgrel=1
pkgdesc="Parameterized testing with any Python test framework"
url="https://github.com/wolever/nose-parameterized"
depends=('python')
makedepends=('python-setuptools')
checkdependsx=('python-nose')
license=('BSD')
arch=('any')
source=("https://pypi.python.org/packages/0d/22/44ff04785ff8a1e4f618a39b20e6d96e1dbb33088fc13d690a035b12b3f6/nose-parameterized-${pkgver}.tar.gz"
"LICENSE.txt::https://github.com/wolever/nose-parameterized/blob/master/LICENSE.txt?raw=true")
sha256sums=('a11c41b0cf8218e7cdc19ab7a1bdf5c141d161cd2350daee819473cc63cd0685'
            'de9e41c9ed2561a7545f339c56caf2acace8fa65ed24968c693bfc6df02fc065')

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

package_python-nose-parameterized() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
    install -Dm644 ../LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}

package_python2-nose-parameterized() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}-py2"
    python2 setup.py install --root="${pkgdir}" --optimize=1
    install -Dm644 ../LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
