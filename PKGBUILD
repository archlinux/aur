# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=python-torf
pkgver=4.1.4
pkgrel=1
pkgdesc='Python module to create, parse and edit torrent files and magnet links'
arch=('any')
url='https://github.com/rndusr/torf/'
license=('GPL3')
depends=('python' 'python-flatbencode')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-httpserver' 'python-pytest-mock' 'python-pytest-xdist')
source=("https://github.com/rndusr/torf/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('c8fb73770f5912efa0303375f3f7a6fd06d634d834a88aab5f36a13115dab08a')

build() {
    cd "torf-${pkgver}"
    python -m build --wheel --no-isolation
}

check() {
    cd "torf-${pkgver}"
    pytest #--file-counts='1' --piece-counts='1' # this currently break the tests
}

package() {
    python -m installer --destdir="$pkgdir" "torf-${pkgver}/dist"/*.whl
}
