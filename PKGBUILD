# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname='python-xsdata'
_pkgname='xsdata'
pkgver=21.9
pkgrel=1
pkgdesc='Naive XML bindings for python'
url='https://xsdata.readthedocs.io'
checkdepends=('python-click-default-group' 'python-docformatter' 'python-pytest' 'python-pytest-benchmark' 'python-toposort' 'python-untokenize')
depends=('python')
makedepends=('python-setuptools')
optdepends=('python-click'
    'python-toposort')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('e99da614ab385a6a633f069c1beb831e9c1833a56dbc49c3c8123444a93557ac')

build() {
    cd "${_pkgname}-${pkgver}"
    python setup.py build 
}

package() {
    cd "${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

check() {
  cd "$_pkgname-$pkgver"
  pytest tests/
}

