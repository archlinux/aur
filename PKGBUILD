_pkgname="aiorun"
pkgname="python-$_pkgname"
pkgver=2024.8.1
pkgrel=1
pkgdesc='A "run" function for asyncio-based apps that does all the boilerplate'
arch=('any')
url="https://github.com/cjrh/aiorun"
license=('Apache')
depends=(
    python
)
makedepends=(
    python-build
    python-flit-core
    python-installer
)
optdepends=(
    'python-uvloop: alternative asyncio event loop'
)
source=("https://files.pythonhosted.org/packages/source/a/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('87ea66b6146756ced58175d2f5ae64519ef96c4657f46b0e0c036e541a22c764')

prepare(){
    cd $_pkgname-$pkgver
    sed -i 's/flit_core >=2,<3/flit_core >=3/' pyproject.toml
}

build(){
    cd $_pkgname-$pkgver
    python -m build --wheel --no-isolation
}

package(){
    cd $_pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
