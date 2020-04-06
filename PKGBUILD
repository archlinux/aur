# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=torf-cli
pkgver=3.1.0
pkgrel=1
pkgdesc='A tool for creating, reading and editing torrent files'
arch=('any')
url='https://github.com/rndusr/torf-cli/'
license=('GPL3')
depends=('python' 'python-torf' 'python-pyxdg')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/rndusr/torf-cli/archive/v${pkgver}.tar.gz"
        "${pkgname}-${pkgver}-fix-tests.patch"::'https://github.com/rndusr/torf-cli/commit/756370d5e40ebb8c1d49ffcf1c718a4f2bc6bd24.patch')
sha256sums=('4b649c9733d178f0522edcde74cb4f114e894b69dbf9b2f405620d2c1248f94c'
            '827dccd59abfd46900a2b14315e29c95824fa4b18516c45987065eae8e4c6778')

prepare() {
    patch -d "${pkgname}-${pkgver}" -Np1 -i "${srcdir}/${pkgname}-${pkgver}-fix-tests.patch"
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
