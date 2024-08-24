# Maintainer: Sumner Evans <sumner.evans98 at gmail dot com>
# Maintainer: David Florness <david at florness dot com>

pkgbase='python-dataclasses-json'
pkgname=('python-dataclasses-json')
_module='dataclasses-json'
pkgver='0.6.7'
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
sha256sums=('33518eac8d2dcf6a46c97dace4411e591a2443d3e3a1bfd87c51ee032f65d9e0')
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
