# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-ffn
_pkgname=${pkgname:7}
pkgver=1.1.2
pkgrel=3
pkgdesc="Financial functions for Python"
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('MIT')
makedepends=(python-build python-installer python-setuptools python-oldest-supported-numpy)
depends=(
    python
    python-decorator
    python-matplotlib
    python-numpy
    python-pandas
    python-scikit-learn
    python-scipy
    python-tabulate
    python-packaging
    python-yfinance
)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('23628944a7cb048129b5f1abceef0777faa43307601c095dbcdcb7bc5c19d514')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE \
        "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
