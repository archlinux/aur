# Maintainer: Vasil Bakalov <jens300304@gmail.com>
pkgname=python-osrparse
url="https://github.com/kszlim/osu-replay-parser"
pkgver=5.0.0
pkgrel=2
pkgdesc="A python parser for osu! replays."
arch=('any')
license=('MIT')
source=(
    "https://github.com/kszlim/osu-replay-parser/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=(
    '6b01d11bf769685ee6450dfe331d150fb1938695dd8f15bdbeb4979af8fe623e'
)
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
