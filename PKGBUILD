# Maintainer: Stephan Springer <buzo+arch@Lini.de>

pkgname=python-myvaillant
_name=myPyllant
pkgver=0.9.8
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
sha256sums=('f892bfdbf33c598e7266006d91df1bf2a4c2e71e321048ddda2d11b517063f83')

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
