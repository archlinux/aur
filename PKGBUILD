# Maintainer: Pierre Chapuis <catwell@archlinux.us>

pkgname=("johnnydep")
pkgver=1.4
pkgrel=1
pkgdesc="Display dependency tree of Python distribution"
arch=("any")
url="https://github.com/wimglenn/johnnydep"
license=("MIT")
options=(!emptydirs)
source=(
    "https://github.com/wimglenn/$pkgname/archive/v${pkgver}.tar.gz"
    "oyaml.tar.gz::https://github.com/wimglenn/oyaml/archive/v0.9.tar.gz"
    "wimpy.tar.gz::https://github.com/wimglenn/wimpy/archive/v0.6.tar.gz"

)
sha256sums=(
    "a415f873d378452275ea2c9c325c3576a16adfee357ff875e55329702a3ecf75"
    "3f972fee4a6fc130d98c75c9ea44c14b11b29ea1777a994d0ad6e30b169278f8"
    "014d21a31980eab48b92c4210e9fdba643b79f7081c64ea9bc97f2be9db9bd58"
)
depends=(
    "python-anytree"
    "python-pkginfo"
    "python-tabulate"
    "python-cachetools"
    "python-colorama"
    "python-pytoml"
    "python-pyaml"
    "python-wheel"
    "python-pip"
    "python-structlog"
)

build () {
    cd "$srcdir"
    for d in "wimpy-0.6" "oyaml-0.9" "$pkgname-$pkgver"; do
        pushd "$d"
            python3 setup.py build
        popd
    done
}

package () {
    cd "$srcdir"
    for d in "wimpy-0.6" "oyaml-0.9" "$pkgname-$pkgver"; do
        pushd "$d"
            python3 setup.py install --root="$pkgdir" -O1
        popd
    done
    install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
