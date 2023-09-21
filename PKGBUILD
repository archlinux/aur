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
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('f2dec09794767c1f66dc68519bca7053dd05b115ec39b5c4b9067722b892c570bd54e4a99a0da57016ce9305d839e1fa437044d5cc0618eae67154eb352968ae')

build() {
    cd $_name-python-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-python-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
