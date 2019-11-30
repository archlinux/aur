# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=torf-cli
pkgver=3.0.1
pkgrel=1
pkgdesc='A tool for creating, reading and editing torrent files'
arch=('any')
url='https://github.com/rndusr/torf-cli/'
license=('GPL3')
depends=('python' 'python-torf' 'python-xdg')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
BUILDENV=('!check') # tests currently fail
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/rndusr/torf-cli/archive/v${pkgver}.tar.gz")
sha256sums=('f25b861200b5cd747d0fb73c1ee566b49b04d7433ae11734d1860431cd0561cb')

build() {
    cd "${pkgname}-${pkgver}"
    python setup.py build
}

check() {
    cd "${pkgname}-${pkgver}"
    PYTHONPATH="$(pwd)/build/lib" pytest
}

package() {
    cd "${pkgname}-${pkgver}"
    python setup.py install --root="$pkgdir" --skip-build --optimize='1'
}
