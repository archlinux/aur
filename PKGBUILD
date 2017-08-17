# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=('python-pyflux')
_module='pyflux'
pkgver='0.4.15'
pkgrel=1
pkgdesc="Time series library for Python."
url="https://www.pyflux.com"
depends=('python'
    #'python-numdifftools'
    'python-numpy'
    'python-pandas'
    'python-patsy'
    'python-pandas-datareader'
    'python-seaborn'
    'python-scipy'
    'python-statsmodels')
checkdepends=('python-pytest')
makedepends=('python-setuptools' 'cython')
license=('BSD')
arch=('any')
source=("https://github.com/RJT1990/pyflux/archive/${pkgver}.tar.gz")
sha256sums=('d11b739e254fddd63746dea62f27776ebaa1fdbf29c8b5eae96a02bd1b1e18f0')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}

check() {
    cd "${srcdir}/${_module}-${pkgver}"
    py.test
}
