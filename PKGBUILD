# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=qcs-api-client
pkgname=python-$_name
pkgver=0.23.1
pkgrel=2
pkgdesc='Python client for the QCS API'
arch=(any)
url='https://github.com/rigetti/qcs-api-client-python'
license=('Apache')
depends=(
    'python>=3.7'
    'python-attrs>=21.3.0'
    'python-dateutil>=2.8.1'
    'python-httpx>=0.23.0'
    'python-iso8601>=1.0.2'
    'python-pydantic>=1.7.2'
    'python-pyjwt>=2.4.0'
    'python-retrying>=1.3.3'
    'python-rfc3339>=6.2'
    'python-toml>=0.10.2'
)
makedepends=(python-build python-dulwich python-installer python-poetry python-trove-classifiers python-wheel)
source=("$url/archive/v$pkgver.tar.gz")
b2sums=('0e1ca526fbd54b5f287cfd0b1d34eddb3c46baf28628210bb788f5e1681ab4b769643536d4002d8afe56bc1ff3bdcd6cbebaeb0514b7e91d49931a29061fdf14')

build() {
    cd $_name-python-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-python-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
