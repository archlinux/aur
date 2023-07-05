_pkgname="aiorun"
pkgname="python-$_pkgname"
pkgver=2023.7.2
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
sha256sums=('95e689dc1b263aaf4556ef8fa73ccae68f38ba0f1c1017fe196ef7da244031f9')

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
