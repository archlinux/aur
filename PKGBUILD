# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=python-torf
pkgver=4.2.7
pkgrel=1
pkgdesc='Python module to create, parse and edit torrent files and magnet links'
arch=('any')
url='https://github.com/rndusr/torf/'
license=('GPL-3.0-or-later')
depends=('python' 'python-flatbencode')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-httpserver' 'python-pytest-mock' 'python-pytest-xdist')
source=("https://github.com/rndusr/torf/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('acbadacce78178d511c8f0e23e0e98fff73e18e79a8cb41674aaa06e304d02eb')

build() {
    cd "torf-${pkgver}"
    python -m build --wheel --no-isolation
}

check() {
    cd "torf-${pkgver}"
    pytest #--file-counts='1' --piece-counts='1'
}

package() {
    python -m installer --destdir="$pkgdir" "torf-${pkgver}/dist"/*.whl
}
