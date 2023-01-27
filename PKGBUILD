# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=qcs-api-client
pkgname=python-$_name
pkgver=0.21.3
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
b2sums=('bb047e52e51651c2dabac4574ea8fe2500a426274cf9233fc35ecf9e93a35b4d0e63236bc3dea77428725898f9ae8f48dd9b72c89d16205f6c3beca8922de398')

build() {
    cd $_name-python-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-python-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
