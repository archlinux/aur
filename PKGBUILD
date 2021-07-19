# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname='python-cffsubr'
_pkgname='cffsubr'
pkgver=0.2.8
pkgrel=1
pkgdesc="Standalone CFF subroutinizer based on AFDKO tx"
url="https://github.com/adobe-type-tools/cffsubr"
checkdepends=('python-pytest')
depends=('python-fonttools')
makedepends=('python-setuptools')
optdepends=()
license=('Apache')
arch=('x86_64')
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz"
    "install.patch")
sha256sums=('e24bd03c94944e1536ec8437ab83fb4ac38477412426c1ffd4e056dd16cde235'
            'fcbb43d2f977e6aca13c4d2ec4e8012417996339b4d7f6b2bf0cedb90ebed9c5')

prepare() {
    cd "${_pkgname}-${pkgver}"
    patch -p1 < ../install.patch
}

build() {
    cd "${_pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

check() {
    cd "$_pkgname-$pkgver"
    python setup.py build_ext --inplace
    PYTHONPATH=src pytest tests/
}
