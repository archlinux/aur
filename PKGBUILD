# Maintainer: Carl George < arch at cgtx dot us >

_name="asyncpg"
pkgname="python-$_name"
pkgver="0.12.0"
pkgrel="1"
pkgdesc="An asyncio PosgtreSQL driver"
arch=("i686" "x86_64")
url="https://github.com/MagicStack/$_name"
license=("Apache")
makedepends=("python-setuptools" "cython")
source=("$url/archive/v$pkgver/$_name-$pkgver.tar.gz"
        remove-package-data.patch)
sha256sums=('9bf6588d9e9dd0fe98b9df7d7e46680c4e9c25e55b12b49bc3f23924e3e53d7d'
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
