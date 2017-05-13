# Maintainer: Carl George < arch at cgtx dot us >

_name="asyncpg"
pkgname="python-$_name"
pkgver="0.11.0"
pkgrel="1"
pkgdesc="An asyncio PosgtreSQL driver"
arch=("i686" "x86_64")
url="https://github.com/MagicStack/$_name"
license=("Apache")
makedepends=("python-setuptools" "cython")
source=("$url/archive/v$pkgver.tar.gz"
        remove-package-data.patch)
sha256sums=('01da0c5e4f4f93b45fceccb7764928ed2fe1770c540a246d8414f34532de7cc3'
            '8ffcda406cd5f92743bfb57b7213ed976876e2d9ecbf5d7e439313de90bd22ad')

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
