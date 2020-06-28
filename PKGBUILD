# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=torf-cli
pkgver=3.2.0
pkgrel=1
pkgdesc='A tool for creating, reading and editing torrent files'
arch=('any')
url='https://github.com/rndusr/torf-cli/'
license=('GPL3')
depends=('python' 'python-torf' 'python-pyxdg')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("https://github.com/rndusr/torf-cli/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
        "torf-cli-${pkgver}-fix-tests.patch"::'https://github.com/rndusr/torf-cli/commit/51db64a6e8a5c773ffa4f6cf9fd3d6deb3bcf432.patch')
sha256sums=('5a39fd950223a133f8ecab2942d27e7a2eb896c8fa144ee921cb7545c3c6ae4b'
            'f274d1536b6c98f276f8e7ad671b2742af15f7733d36f5076fd14dc126e30335')

prepare() {
    patch -d "${pkgname}-${pkgver}" -Np1 -i "${srcdir}/torf-cli-${pkgver}-fix-tests.patch"
}

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
