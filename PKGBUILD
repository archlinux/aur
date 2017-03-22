#Maintainer: David McInnis <davidm@eagles.ewu.edu>

pkgbase=('python-nose-parameterized')
pkgname=('python-nose-parameterized' 'python2-nose-parameterized')
_module='nose-parameterized'
pkgver='0.6.0'
pkgrel=1
pkgdesc="Parameterized testing with any Python test framework"
url="https://github.com/wolever/nose-parameterized"
depends=('python' 'python2')
makedepends=('python-setuptools' 'python2-setuptools')
checkdepends=('python-nose' 'python2-nose')
license=('BSD')
arch=('any')
source=("https://pypi.python.org/packages/46/39/419354bd83a87406ec4b632d5df9436e7ab30e19f1493358bc664029e9c2/nose-parameterized-${pkgver}.tar.gz")
sha256sums=('d35e677aba2f15135b6b7ea7feb88f792b899492ba5365ec0e269015df5214ce')

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
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}

package_python2-nose-parameterized() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}-py2"
    python2 setup.py install --root="${pkgdir}" --optimize=1
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
