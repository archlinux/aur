# Maintainer: Guillaume Horel <guillaume.horel at gmail dot com>
# Contributor: Carl George < arch at cgtx dot us >

pkgname="python-asyncpg"
_pkgname="asyncpg"
pkgver="0.20.0"
pkgrel="1"
pkgdesc="An asyncio PosgtreSQL driver"
arch=("x86_64")
url="https://github.com/MagicStack/asyncpg"
license=("Apache")
makedepends=("python-setuptools" "cython")
checkdepends=("python-pytest"
    'postgresql')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz"
        remove-package-data.patch)
sha256sums=('aa02dce5d5b801cff7dd2d99b767f5db312858f527ec1764777aad1fdefb5a7a'
            'fbd60ee542f87222d26b69095d3c5bd70863f8a066eb56035902d1ded836659d')

prepare() {
    cd "$_pkgname-$pkgver"
    patch -p1 -i ../remove-package-data.patch
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
    pytest
}
