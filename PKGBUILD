# Maintainer: Chris Billington <chrisjbillington@gmail.com>
pkgname=python-questionary
_name=${pkgname#python-}
pkgver=2.1.0
pkgrel=2
pkgdesc="Python library to build pretty command line user prompts"
license=("MIT")
url="https://pypi.python.org/pypi/$_name"
depends=('python-prompt_toolkit')
makedepends=(python-build python-installer python-wheel python-poetry-core)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('6302cdd645b19667d8f6e6634774e9538bfcd1aad9be287e743d96cacaf95587')
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
