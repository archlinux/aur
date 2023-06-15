# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=python-torf
pkgver=4.2.0
pkgrel=1
pkgdesc='Python module to create, parse and edit torrent files and magnet links'
arch=('any')
url='https://github.com/rndusr/torf/'
license=('GPL3')
depends=('python' 'python-flatbencode')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-httpserver' 'python-pytest-mock' 'python-pytest-xdist')
source=("https://github.com/rndusr/torf/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('3797d2b1a7d7921bb79ba48089cd3f19d0692d8d04b3b114992b4748ac731a01')

build() {
    cd "torf-${pkgver}"
    python -m build --wheel --no-isolation
}

check() {
    cd "torf-${pkgver}"
    pytest --file-counts='1' --piece-counts='1'
}

package() {
    python -m installer --destdir="$pkgdir" "torf-${pkgver}/dist"/*.whl
}
