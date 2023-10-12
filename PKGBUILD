# Maintainer: Sumner Evans <sumner.evans98 at gmail dot com>
# Maintainer: David Florness <david at florness dot com>

pkgbase='python-dataclasses-json'
pkgname=('python-dataclasses-json')
_module='dataclasses-json'
pkgver='0.6.1'
pkgrel=1
pkgdesc='Easily serialize Python Data Classes to and from JSON'
url='https://github.com/lidatong/dataclasses-json'
depends=(
    'python'
    'python-marshmallow'
    'python-typing_inspect'
)
optdepends=()
makedepends=(
    'python-build'
    'python-installer'
    'python-poetry-core'
    'python-poetry-dynamic-versioning'
)
checkdepends=(
    'python-hypothesis'
    'python-pytest-mypy'
)
license=('MIT')
arch=('any')
source=("https://github.com/lidatong/dataclasses-json/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('07380972f8028939c361f494beb63eee205fb4dcfcb947cf84c2a2f5a94ac7a5')
export POETRY_DYNAMIC_VERSIONING_BYPASS="$pkgver"

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python -m build --wheel --no-isolation
}

check() {
    cd "${srcdir}/${_module}-${pkgver}"
    python -m pytest
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
