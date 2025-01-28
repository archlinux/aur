_pkgname="aiorun"
pkgname="python-$_pkgname"
pkgver=2025.1.1
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
sha256sums=('86d1075a034ce2671ab532db06e9204fe784cdd0c66ca7b8cc47a7527d0d50a3')

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
