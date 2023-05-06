# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=qcs-api-client
pkgname=python-$_name
pkgver=0.21.5
pkgrel=1
pkgdesc='Python client for the QCS API'
arch=(any)
url='https://github.com/rigetti/qcs-api-client-python'
license=('Apache')
depends=(
    python
    python-attrs
    python-dateutil
    python-httpx
    python-iso8601
    python-pydantic
    python-pyjwt
    python-retrying
    python-rfc3339
    python-toml
)
makedepends=(python-build python-dulwich python-installer python-poetry python-trove-classifiers python-wheel)
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('296b7a5b708f99a0a2aaaaf10ee363dac09bf49b34194e91f74f0a6baf86661b592b952e4fad993f938a4d0cb199d54316627483c239154dfaaddf34bf9843b8')

build() {
    cd $_name-python-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-python-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
