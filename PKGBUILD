# Maintainer: selpast <selpast@pm.me>

pkgname=mloader
pkgver=1.1.12
pkgrel=3
pkgdesc='Command-line tool to download manga from mangaplus'
arch=(any)
url='https://github.com/hurlenko/mloader'
license=(GPL3)
depends=(python-click python-protobuf python-requests)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz)
sha256sums=('24201e8c936e7790ea98b4e2edec4fdb16742851b752a1b95a83550219d2141a')

build() {
    cd ${pkgname}-${pkgver}
    protoc --proto_path . --python_out ./mloader response.proto
    python -m build --wheel --no-isolation
}

package() {
    cd ${pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
