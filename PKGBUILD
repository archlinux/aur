_pkgname="aiorun"
pkgname="python-$_pkgname"
pkgver=2024.5.1
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
sha256sums=('c9911e414b6eb4f32ed50c964c4b8fded072dfd09b7fae6b953b9694bf7d0deb')

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
