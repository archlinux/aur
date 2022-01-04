pkgname='python-randomgen'
_pkgname='randomgen'
pkgver='1.21.2'
pkgrel=1
pkgdesc="Numpy-compatible bit generators and random variates distributions"
url="http://github.com/bashtage/randomgen"
depends=('python' 'python-numpy')
makedepends=('cython' 'python-setuptools')
checkdepends=('python-pytest')
license=('BSD-3')
arch=('x86_64')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('66d80306123ed54f3f68ac3bd0c02909a4adcadb878b3aaf9e3bb8142d8dbf2f')

build() {
    cd "${_pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}

check() {
    cd "${_pkgname}-${pkgver}"
    python setup.py build_ext --inplace
    pytest randomgen
}
