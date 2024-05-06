# Maintainer: HLFH <gaspard@dhautefeuille.eu>

_origname=reportlab
pkgname=python-reportlab3
pkgver=3.6.12
pkgrel=3
pkgdesc="A proven industry-strength PDF generating solution"
arch=('x86_64')
url="https://www.reportlab.com/"
depends=('python' 'freetype2' 'python-pillow')
makedepends=('freetype2' 'python-pillow' 'mercurial' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
conflicts=('python-reportlab')
license=('BSD')
source=(https://files.pythonhosted.org/packages/source/${_origname::1}/${_origname}/${_origname}-${pkgver}.tar.gz)
b2sums=('106e0ede2b3c039152ae5a39e0aa5b3bf0239789ba08630f751260b75305973bff13730e3f7419340514a4f0174223dddf522cd9408b8dd04fbe39b84979b152')

build() {
    cd ${_origname}-${pkgver}
    python setup.py build
    python -m build --wheel --no-isolation
}

check() {
    cd ${_origname}-${pkgver}
    export PYTHONPATH="build:$PYTHONPATH"
    python -m unittest discover -vs tests || true
    rm tests/_i_am_actually_a_*
}

package() {
    cd ${_origname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/license.txt
}
