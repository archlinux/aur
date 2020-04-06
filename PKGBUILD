# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=python-torf
pkgver=3.0.0
pkgrel=1
pkgdesc='Python module to create, parse and edit torrent files and magnet links'
arch=('any')
url='https://github.com/rndusr/torf/'
license=('GPL3')
depends=('python' 'python-flatbencode')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-pytest-xdist')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/rndusr/torf/archive/v${pkgver}.tar.gz")
sha256sums=('575a1ae9c01188ac7a02ef72ccffd56452af4de759ac8a953320440b9d4f78af')

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
