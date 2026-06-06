# Maintainer: steffeno <steffeno dash etc at protonmail dot com>

pkgname=python-randcrack
_pkgname=randcrack
pkgver=0.3.0
pkgrel=1
pkgdesc="Python random module cracker / predictor"
arch=('any')
url='https://github.com/tna0y/Python-random-module-cracker'
license=('MIT')
depends=('python')
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('b370344b70ccf09987d3fe598bef273e8be698aa468f7abe1a4d52050b16b771')

build() {
    cd "$srcdir/Python-random-module-cracker-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "$srcdir/Python-random-module-cracker-$pkgver"
    pytest
}

package() {
    cd "$srcdir/Python-random-module-cracker-$pkgver"

    python -m installer \
        --destdir="$pkgdir" \
        dist/*.whl

    install -Dm644 LICENSE.txt \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -Dm644 README.md \
        "$pkgdir/usr/share/doc/$pkgname/README.md"
}
