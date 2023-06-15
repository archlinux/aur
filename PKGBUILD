# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=torf-cli
pkgver=5.1.0
pkgrel=1
pkgdesc='A tool for creating, reading and editing torrent files'
arch=('any')
url='https://github.com/rndusr/torf-cli/'
license=('GPL3')
depends=('python' 'python-torf' 'python-pyxdg')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
source=("https://github.com/rndusr/torf-cli/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('bb36f2c70bb0f1aa51abea253608517f115dfcd09e075960e0c79bd60e440f35')

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
