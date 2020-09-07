# Maintainer: Pierre Chapuis <arch@catwell.info>

pkgname=("johnnydep")
pkgver=1.5
pkgrel=1
pkgdesc="Display dependency tree of Python distribution"
arch=("any")
url="https://github.com/wimglenn/johnnydep"
license=("MIT")
options=(!emptydirs)
source=("https://github.com/wimglenn/$pkgname/archive/v${pkgver}.tar.gz")
sha256sums=("a72501f5c31e16134e67addbeaba9fb7eccf513a137e2add3d07ef7beddc9bc3")
depends=(
    "python-anytree"
    "python-pkginfo"
    "python-tabulate"
    "python-cachetools"
    "python-colorama"
    "python-toml"
    "python-pyaml"
    "python-wheel"
    "python-pip"
    "python-structlog"
    "python-oyaml"
    "python-wimpy"
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
