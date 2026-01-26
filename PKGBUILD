# Maintainer: Markus Näther <naether.markus@gmail.com>

pkgname=python-simple_parsing
pkgver=0.1.8
pkgrel=1
pkgdesc="Simple, Elegant, Typed Argument Parsing with argparse"
arch=('any')
url="https://github.com/lebrice/SimpleParsing"
license=('MIT')
depends=(
	'python'
	'python-pyyaml'
)
makedepends=(python-build python-poetry-core python-installer python-wheel python-setuptools)
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/lebrice/SimpleParsing/archive/refs/tags/v${pkgver}.tar.gz"
	"pyproject.diff"
)
sha256sums=(
	'8e23c5dc095e0f30fdb3947a8c1bdaf05c2ce394887b5aa2c460d12a9ffeb98e'
	'f70f706f6d7300425cac456475495316dea33596bde914c4e354d0f560be5dcc'
)

prepare() {
    patch -p1 < "${srcdir}/pyproject.diff"
}

package() {
    cd "SimpleParsing-${pkgver}"
    poetry install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
