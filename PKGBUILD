# Maintainer: Sumner Evans <sumner.evans98 at gmail dot com>
# Maintainer: David Florness <david at florness dot com>

pkgbase='python-dataclasses-json'
pkgname=('python-dataclasses-json')
_module='dataclasses-json'
pkgver='0.5.13'
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
)
checkdepends=('python-pytest-mypy')
license=('MIT')
arch=('any')
source=("https://github.com/lidatong/dataclasses-json/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6bd1f74ad518dab48ad01eb14f84ecf37d2b3eee3550b931842a393b45793306')

prepare() {
    cd "${srcdir}/${_module}-${pkgver}"
    # from <https://github.com/lidatong/dataclasses-json/blob/v0.5.13/.github/workflows/pythonpackage.yml#L71-L73>
    sed -i "s/version = \"0.0.0\"/version = \"${pkgver}\"/" pyproject.toml
    echo "__version__ = '${pkgver}'" > ./dataclasses_json/_version.py
}

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
}
