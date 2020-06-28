# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=python-torf
pkgver=3.0.2
pkgrel=1
pkgdesc='Python module to create, parse and edit torrent files and magnet links'
arch=('any')
url='https://github.com/rndusr/torf/'
license=('GPL3')
depends=('python' 'python-flatbencode')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-pytest-xdist' 'python-pytest-httpserver')
source=("https://github.com/rndusr/torf/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('5989b00132d8823ae20375ce5d731a41859b5ad234446025e520e1356eb49898')

build() {
    cd "torf-${pkgver}"
    python setup.py build
}

check() {
    cd "torf-${pkgver}"
    PYTHONPATH="$(pwd)/build/lib" pytest
}

package() {
    cd "torf-${pkgver}"
    python setup.py install --root="$pkgdir" --skip-build --optimize='1'
}
