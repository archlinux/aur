# Maintainer: Guillaume Horel <guillaume.horel at gmail dot com>
# Contributor: Carl George < arch at cgtx dot us >

pkgname="python-asyncpg"
_pkgname="asyncpg"
pkgver="0.20.1"
pkgrel="1"
pkgdesc="An asyncio PosgtreSQL driver"
arch=("x86_64")
url="https://github.com/MagicStack/asyncpg"
license=("Apache")
makedepends=("python-setuptools" "cython")
checkdepends=("python-pytest"
    'postgresql')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz"
        remove-package-data.patch
        fix-test.patch)
sha256sums=('394bf19bdddbba07a38cd6fb526ebf66e120444d6b3097332b78efd5b26495b0'
            'fbd60ee542f87222d26b69095d3c5bd70863f8a066eb56035902d1ded836659d'
            '93d64b7bdea356576536ebe32b5a01930130ac58e6eb414a18661fc57b487e64')

prepare() {
    cd "$_pkgname-$pkgver"
    patch -p1 -i ../remove-package-data.patch
    patch -p1 < ../fix-test.patch
}

build() {
    cd "$_pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$_pkgname-$pkgver"
    python setup.py install --skip-build --root="$pkgdir" --optimize=1
}

check() {
    cd "$_pkgname-$pkgver"
    python setup.py build_ext --inplace
    python setup.py test
}
