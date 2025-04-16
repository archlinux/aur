# Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>
# Contributor: Jiachen Yang <farseerfc@gmail.com>
# Contributor: Phil Schaf <flying-sheep@web.de>

_name=pdfrw
pkgbase=python-pdfrw
pkgname=(python-pdfrw)
pkgver=0.4_2
_pkgver=${pkgver/_/-}
pkgrel=1
pkgdesc='A pure Python library that reads and writes PDFs (pdfrw2 fork)'
arch=('any')
url="https://github.com/sarnold/$_name"
license=('MIT')
depends=('python')
makedepends=(python-build python-installer python-wheel python-setuptools)
source=(
    "$_name-$pkgver.tar.gz::https://github.com/sarnold/$_name/archive/refs/tags/$_pkgver.tar.gz"
    "fix-escape-sequences.patch"
)
sha256sums=('98573f7854629134bbda93989f5341ace3add1c33cd216bc6713eadf3e9eed4c'
            'cd0e2d8fde89903b90506e250d3e58ff25a167f4eaea9206c9ce25bcb702ff71')

prepare() {
    cd $_name-$_pkgver
    patch -p1 -i"$srcdir/fix-escape-sequences.patch"
}

build() {
    cd $_name-$_pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$_pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
