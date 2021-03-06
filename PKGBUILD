# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=python-torf
pkgver=3.1.3
pkgrel=2
pkgdesc='Python module to create, parse and edit torrent files and magnet links'
arch=('any')
url='https://github.com/rndusr/torf/'
license=('GPL3')
depends=('python' 'python-flatbencode')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-pytest-xdist' 'python-pytest-httpserver')
source=("https://github.com/rndusr/torf/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('9952b1a273266facff279b6fa74d28605fe5978d277483f9218ff5cb1c24121f')

build() {
    cd "torf-${pkgver}"
    python setup.py build
}

check() {
    cd "torf-${pkgver}"
    PYTHONPATH="$(pwd)/build/lib" pytest --file-counts='1' --piece-counts='1'
}

package() {
    cd "torf-${pkgver}"
    PYTHONHASHSEED='0' python setup.py install --root="$pkgdir" --skip-build --optimize='1'
}
