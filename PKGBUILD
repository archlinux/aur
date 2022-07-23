# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=torf-cli
pkgver=4.0.3
pkgrel=1
pkgdesc='A tool for creating, reading and editing torrent files'
arch=('any')
url='https://github.com/rndusr/torf-cli/'
license=('GPL3')
depends=('python' 'python-torf' 'python-pyxdg')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
source=("https://github.com/rndusr/torf-cli/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('6c38b777be3d7372296257ffc9d7b83c3decab26015ee520fd3325c0826df2db')

build() {
    cd "${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

check() {
    cd "${pkgname}-${pkgver}"
    PYTHONPATH="$(pwd)/build/lib" pytest
}

package() {
    python -m installer --destdir="$pkgdir" "${pkgname}-${pkgver}/dist"/*.whl
}
