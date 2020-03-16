# Maintainer: Qirui Wang <wqr.prg@gmail.com>
# Contributor: Carl George < arch at cgtx dot us >

_name="sanic"
pkgname="python-$_name"
pkgver=19.12.2
pkgrel=1
pkgdesc='Async Python 3.6+ web server/framework | Build fast. Run fast.'
arch=("any")
url='https://sanicframework.org/'
license=("MIT")
depends=(
    'python-httptools'
    'python-aiofiles'
    'python-websockets'
    'python-multidict'
    'python-httpx'
    'python-uvloop'
    'python-ujson'
)
makedepends=("python-setuptools")
source=(
    "https://github.com/huge-success/${_name}/archive/v${pkgver}.tar.gz"
    'https://github.com/huge-success/sanic/commit/5d273fe922ecd7d80ddfb88c84787a9b3ee7f4eb.patch'
    'https://github.com/huge-success/sanic/commit/805d8f3af26fe1d40d72d71d9b58c0ba72bbd2ab.patch'
)
sha256sums=('baf596636ac6d2c61947d133781f53d1cee93ed94610986cc799e8c96d03a1d4'
            '5b86c9e4cf3a8f204156cfc108a8af21bc4c4c3b490a6e7d473742707e72dafd'
            'fd0d6e8592605c21420c36f5e8a22c97e19440ab89dcb1914d45a01a2da75076')

prepare() {
    cd "$_name-$pkgver"

    # Fix compatibility with httpx
    patch -p1 -i ../5d273fe922ecd7d80ddfb88c84787a9b3ee7f4eb.patch
    patch -p1 -i ../805d8f3af26fe1d40d72d71d9b58c0ba72bbd2ab.patch
}

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --skip-build --root="$pkgdir" --optimize=1
    install -Dm644 ./LICENSE "$pkgdir/usr/share/licenses/$pkgname/licence"
}
