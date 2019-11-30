# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=python-torf
pkgver=2.1.0
pkgrel=1
pkgdesc='Python module to create, parse and edit torrent files and magnet links'
arch=('any')
url='https://github.com/rndusr/torf/'
# NOTE: git master switched to GPL3
# https://github.com/rndusr/torf/commit/9b2fecaee33f93457202729582b1e7c6ee1cedc0
license=('MIT')
depends=('python' 'python-bencoder-pyx')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/rndusr/torf/archive/v${pkgver}.tar.gz")
sha256sums=('30a488dc8df9df751cc56141a94c655cf5c85fca248422061c5ac50517ecdd47')

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
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
