# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=dwdweather2
pkgname=python-${_pkgname}
pkgver=0.14.0
pkgrel=4
pkgdesc="Client to access weather data from Deutscher Wetterdienst (DWD), the federal meteorological service in Germany"
arch=('x86_64')
url="https://github.com/panodata/dwdweather2"
license=('MIT')
depends=(
    'python-tqdm'
    'python-dateutil'
    'python-requests'
    'python-requests-cache'
    'python-beautifulsoup4'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/panodata/${_pkgname}/archive/${pkgver}.tar.gz")
b2sums=('66624d2857a85ffd8ea2accc323ea77db837875a1a5fc9fcfbb080bb03687ca8d87454e901de967b575fc02293cc882ad2d26da99ca4cc21879c756409611945')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
