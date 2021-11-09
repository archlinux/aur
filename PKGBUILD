# Maintainer: Pierre Chapuis <arch@catwell.info>

pkgname=("johnnydep")
pkgver=1.10
pkgrel=1
pkgdesc="Display dependency tree of Python distribution"
arch=("any")
url="https://github.com/wimglenn/johnnydep"
license=("MIT")
options=(!emptydirs)
source=("$pkgname-src-$pkgver.tar.gz::https://github.com/wimglenn/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=("600276b8281365fb58972e6c5895f46726d35f86130e7a17154708ba14301e84")
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
