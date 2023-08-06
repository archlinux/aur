# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=qcs-api-client
pkgname=python-$_name
pkgver=0.21.6
pkgrel=1
pkgdesc='Python client for the QCS API'
arch=(any)
url='https://github.com/rigetti/qcs-api-client-python'
license=('Apache')
depends=(
    'python>=3.7'
    'python-attrs>=21.3.0'
    'python-attrs<22.0'
    'python-dateutil>=2.8.1'
    'python-dateutil<3.0'
    'python-httpx>=0.23.0'
    'python-httpx<0.24'
    'python-iso8601>=1.0.2'
    'python-iso8601<2.0'
    'python-pydantic>=1.7.2'
    'python-pydantic<2.0'
    'python-pyjwt>=2.4.0'
    'python-pyjwt<3.0'
    'python-retrying>=1.3.3'
    'python-retrying<2.0'
    'python-rfc3339>=6.2'
    'python-rfc3339<7.0'
    'python-toml>=0.10.2'
    'python-toml<0.11'
)
makedepends=(python-build python-dulwich python-installer python-poetry python-trove-classifiers python-wheel)
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('bd7038895f19a097d9363e4156701686cc2f3b9bdf6770f90433e3d72caebaf94b36c8d25ac76f1bdbdabc41f9d44da41ea19315e2cd995b59f8d2045d3c0ce5')

build() {
    cd $_name-python-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-python-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
