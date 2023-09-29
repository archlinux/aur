# Maintainer: Victor <v1c70rp@gmail.com>
# Contributor: Techcable <Techcable at techcable dot net>

pkgname=mathicsscript
pkgver=6.0.0
pkgrel=2
pkgdesc="A more advanced command-line interface to Mathics."
arch=("any")
url="https://mathics.org/"
license=('GPL3')
depends=("mathics>6.0.0"
         "mathics-scanner>=1.3.0"
         "python-click"
         "python-colorama"
         "python-columnize"
         "python-networkx"
         "python-prompt_toolkit>=3.0.18"
         "python-pygments>=2.9.0"
         "mathics-pygments>=1.0.2"
         "python-term-background>=1.0.1")
optdepends=(
    "python-yaml: Used for admin-tools/make-tables.sh to build JSON tables"
    "python-pyqt5: For inte ractive display of graphs via matplotlib"
    "python-cairosvg: For rendering plots and graphs as SVGs via matplotlib"
    "python-cson: for xasy"
    "python-matplotlib: For rendering SVG plots"
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
source=("$pkgname-$pkgver.tar.gz::https://github.com/Mathics3/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('4e0268236c5c19d6bb7c68b8935e91163f78e78761ff83ec094b441c8ff55ae3')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    curl -O "https://raw.githubusercontent.com/Mathics3/$pkgname/$pkgver/requirements-dev.txt"
    curl -O "https://raw.githubusercontent.com/Mathics3/$pkgname/$pkgver/requirements-full.txt"
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    # For some reason, setuptools seems to like including these
    # test files....
    rm -r "${pkgdir}"/usr/lib/python*/site-packages/test
}
