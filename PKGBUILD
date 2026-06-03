# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-pyre-extensions
_pkgname=pyre_extensions
pkgver=0.0.32
pkgrel=1
pkgdesc="Type system extensions for use with the pyre type checker"
arch=('any')
url="https://pyre-check.org"
license=('MIT')
depends=(
    'python'
    'python-typing-inspect'
    'python-typing_extensions'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
source=("https://files.pythonhosted.org/packages/source/p/pyre-extensions/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('5396715f14ea56c4d5fd0a88c57ca7e44faa468f905909edd7de4ad90ed85e55')

build() {
    cd "$srcdir/${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

check() {
    cd "$srcdir/${_pkgname}-${pkgver}"
    PYTHONPATH="$PWD:$PYTHONPATH" python -c "import pyre_extensions; print(getattr(pyre_extensions, '__version__', 'ok'))"
}

package() {
    cd "$srcdir/${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
