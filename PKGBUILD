# Maintainer: Stephan Springer <buzo+arch@Lini.de>

pkgname=python-myvaillant
_name=myPyllant
pkgver=0.9.9
pkgrel=1
pkgdesc='Python library for the myVaillant API'
arch=(any)
url="https://github.com/signalkraft/$_name"
license=(MIT)
depends=(
    python-aiohttp
    python-pydantic
)
makedepends=(
    python-build
    python-installer
    python-hatchling
    python-hatch-vcs
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6b29e85bf64b603e020e70dd3af71cd49055e24d0ec5ffc7e4444a50a1f09cff')

build() {
    cd "$_name-$pkgver"
    export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
