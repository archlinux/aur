# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=dwdweather2
pkgname=python-${_pkgname}
pkgver=0.14.0
pkgrel=8
pkgdesc="Client to access weather data from Deutscher Wetterdienst (DWD), the federal meteorological service in Germany"
arch=(any)
url=https://github.com/panodata/dwdweather2
license=(MIT)
depends=(
    python-beautifulsoup4
    python-dateutil
    python-htmllistparse
    python-requests
    python-requests-cache
    python-tqdm
)
makedepends=(
    python-build
    python-installer
    python-setuptools
    python-wheel
)
source=($_pkgname-$pkgver.tar.gz::https://github.com/panodata/$_pkgname/archive/$pkgver.tar.gz)
b2sums=('66624d2857a85ffd8ea2accc323ea77db837875a1a5fc9fcfbb080bb03687ca8d87454e901de967b575fc02293cc882ad2d26da99ca4cc21879c756409611945')

build() {
    cd $_pkgname-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    # Remove site-packages/tests
    local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
    rm -r "$pkgdir"/usr/lib/python$python_version/site-packages/tests
}
