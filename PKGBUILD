# Maintainer: Pierre Chapuis <arch@catwell.info>

pkgname=("johnnydep")
pkgver=1.20.4
pkgrel=1
pkgdesc="Display dependency tree of Python distribution"
arch=("any")
url="https://github.com/wimglenn/johnnydep"
license=("MIT")
options=(!emptydirs)
source=("$pkgname-src-$pkgver.tar.gz::https://github.com/wimglenn/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=("84bb3b1f34e88908b23149e7e6e7192e4d6f56b4130f179ccfab49b7ce92d49b")
depends=(
    "python-anytree"
    "python-structlog"
    "python-tabulate"
    "python-wimpy"
    "python-cachetools"
    "python-oyaml"
    "python-toml"
    "python-pip"
    "python-packaging"
    "python-wheel"
)

build () {
    cd "$srcdir/$pkgname-$pkgver"
    python3 setup.py build
}

package () {
    cd "$srcdir"
    pushd "$pkgname-$pkgver"
        python3 setup.py install --root="$pkgdir" -O1
    popd
    install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
