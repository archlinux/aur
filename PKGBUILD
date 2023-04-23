# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=qcs-api-client
pkgname=python-$_name
pkgver=0.21.4
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
b2sums=('2a513190e9d3aca447ead5a2b0424d703a6df278154345e38daf17c292acbde3ae19e52b7e1502d6ea7130ab1833cc1406a4dd7733241ccb93a465e844a9dd80')

build() {
    cd $_name-python-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-python-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
