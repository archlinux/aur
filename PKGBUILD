# Maintainer: Vasil Bakalov <jens300304@gmail.com>
pkgname=python-osrparse
url="https://github.com/kszlim/osu-replay-parser"
pkgver=6.0.0
pkgrel=1
pkgdesc="A python parser for osu! replays."
arch=('any')
license=('MIT')
source=(
    "https://github.com/kszlim/osu-replay-parser/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('f8387a070b627dd478ae190932f0199a0c3ee06535ad486cf6a44938ef5a6689')
depends=('python')
checkdepends=('python-pytest')
makedepends=('python-setuptools')
conflicts=('python-osrparse-git')

build() {
    cd "$srcdir/osu-replay-parser-${pkgver}"
    python setup.py build
}

check() {
    cd "$srcdir/osu-replay-parser-${pkgver}"
    pytest
}

package() {
    cd "$srcdir/osu-replay-parser-${pkgver}"
    python setup.py install --root="$pkgdir"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
