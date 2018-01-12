# Maintainer: Guillaume Horel <guillaume.horel at gmail dot com>
# Contributor: Carl George < arch at cgtx dot us >

_name="asyncpg"
pkgname="python-$_name"
pkgver="0.14.0"
pkgrel="1"
pkgdesc="An asyncio PosgtreSQL driver"
arch=("i686" "x86_64")
url="https://github.com/MagicStack/$_name"
license=("Apache")
makedepends=("python-setuptools" "cython")
checkdepends=("python-pytest")
source=("$url/archive/v$pkgver/$_name-$pkgver.tar.gz"
        remove-package-data.patch)
sha256sums=('ab2ea8391e40b9dd3a0993d40db6c9ef3ba02c6cb99465feb5c56e44c77b28f1'
            'fbd60ee542f87222d26b69095d3c5bd70863f8a066eb56035902d1ded836659d')

prepare() {
    cd "$_name-$pkgver"
    patch -p1 -i ../remove-package-data.patch
}

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
    depends=("python")
    cd "$_name-$pkgver"
    python setup.py install --skip-build --root="$pkgdir" --optimize=1
}

check() {
    cd "$_name-$pkgver"
    python setup.py build_ext --inplace
    pytest
}
