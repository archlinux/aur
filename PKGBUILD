# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=qcs-api-client
pkgname=python-$_name
pkgver=0.21.2
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
makedepends=(python-build python-installer python-poetry python-wheel)
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('53eb2a3394fccc6f5914e0d76fa833ac8e2fc2baafaf06b6b9c3984172570d00d82a85205fdb6ed59cdf2452f174903baeb647ed52a1471823e33cf01562d5ef')

build() {
    cd $_name-python-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-python-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
