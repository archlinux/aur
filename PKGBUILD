# Maintainer: Guillaume Horel <guillaume.horel at gmail dot com>
# Contributor: Carl George < arch at cgtx dot us >

_name="asyncpg"
pkgname="python-$_name"
pkgver="0.15.0"
pkgrel="1"
pkgdesc="An asyncio PosgtreSQL driver"
arch=("x86_64")
url="https://github.com/MagicStack/$_name"
license=("Apache")
makedepends=("python-setuptools" "cython")
checkdepends=("python-pytest")
source=("$url/archive/v$pkgver/$_name-$pkgver.tar.gz"
        remove-package-data.patch)
sha256sums=('b8a23279080e9f56e30b9fc1b89d8ce0782a515e82862508c8d86b86fb9b1241'
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
