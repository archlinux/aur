_pkgname="aiorun"
pkgname="python-$_pkgname"
pkgver=2022.11.1
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
sha256sums=('d820cebffdea82f9c1750cc396f3a58e4c0d277a2c51f11e86ed6ab7736dce59')

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
