# Maintainer: Chris Billington <chrisjbillington@gmail.com>
pkgname=python-questionary
_name=${pkgname#python-}
pkgver=2.0.1
pkgrel=2
pkgdesc="Python library to build pretty command line user prompts"
license=("MIT")
url="https://pypi.python.org/pypi/$_name"
depends=('python-prompt_toolkit')
makedepends=(python-build python-installer python-wheel python-poetry-core)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('bcce898bf3dbb446ff62830c86c5c6fb9a22a54146f0f5597d3da43b10d8fc8b')
arch=('any')

prepare() {
    cd "$_name-$pkgver"
    sed -i -E "/^prompt_toolkit =/s/,.*$/\"/" pyproject.toml
}

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
