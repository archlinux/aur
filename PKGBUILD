# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Frederic Van Assche <frederic@fredericva.com>
_name=influxdb-client
pkgname=python-$_name
pkgver=1.49.0
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
b2sums=('fb060acff04f6b7fc010278b1bad7f7152cf21845da59d0741d4fcf3ed1269db172e6e2657cde4638904ac9fa4bf0be45d8e832c38ab76e932ba90bd427f141d')

build() {
    cd $_name
    python -m build --wheel --no-isolation
}

package() {
    cd $_name
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
