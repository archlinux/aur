# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Frederic Van Assche <frederic@fredericva.com>
_name=influxdb-client
pkgname=python-$_name
pkgver=1.50.0
pkgrel=1
pkgdesc="InfluxDB 2.0 Python client"
arch=(any)
url=https://github.com/influxdata/influxdb-client-python/
license=(MIT)
depends=(
    python-certifi
    python-dateutil
    python-reactivex
    python-urllib3
)
makedepends=(
    git
    python-build
    python-installer
    python-setuptools
)
optdepends=(
    "python-numpy: Support data_frame"
    "python-pandas: Support query_data_frame"
)
source=($_name::git+https://github.com/influxdata/$_name-python.git#tag=v$pkgver)
b2sums=('988275088c9a8b35ae9b4f80a8131c6a80bdfee7817413cef0cea11626e0b61994cc22ec26f39f599097f0334475445336838158329b94169758ef5e8fd54671')

build() {
    cd $_name
    python -m build --wheel --no-isolation
}

package() {
    cd $_name
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
