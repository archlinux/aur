# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=torf-cli
pkgver=3.4.0
pkgrel=1
pkgdesc='A tool for creating, reading and editing torrent files'
arch=('any')
url='https://github.com/rndusr/torf-cli/'
license=('GPL3')
depends=('python' 'python-torf' 'python-pyxdg')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("https://github.com/rndusr/torf-cli/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('8ac4793ca713067f9916dfd2236efce69754e4ae8d068dfaaa97a7e5e7725b0d')

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
    PYTHONHASHSEED='0' python setup.py install --root="$pkgdir" --skip-build --optimize='1'
}
