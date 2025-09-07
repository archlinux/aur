# Maintainer: Victor <v1c70rp@gmail.com>
# Contributor: Techcable <Techcable at techcable dot net>

pkgname=mathicsscript
pkgver=9.0.0
pkgrel=1
pkgdesc="A more advanced command-line interface to Mathics."
arch=("any")
url="https://mathics.org/"
license=('GPL3')
depends=("mathics>=9.0.0"
         "mathics-scanner>=2.0.0"
         "python-click>=8.0.0"
         "python-colorama"
         "python-columnize"
         "python-networkx"
         "python-prompt_toolkit>=3.0.18"
         "python-pygments>=2.9.0"
         "mathics-pygments>=1.0.2"
         "python-term-background>=1.0.1")
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'python-pytest')
optdepends=(
    "python-yaml: Used for admin-tools/make-tables.sh to build JSON tables"
    "python-pyqt6: For interactive display of graphs via matplotlib"
    "python-cairosvg: For rendering plots and graphs as SVGs via matplotlib"
    "python-cson: for xasy"
    "python-matplotlib: For rendering SVG plots"
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
source=("$pkgname-$pkgver.tar.gz::https://github.com/Mathics3/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('3115fb57a1311e1fe392428355b740b9b6ec46489339baaeea904554ebda555d')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  # Remove test that require mathicsscript installed before testing
  rm test/test_returncode.py
  export PYTHONPATH="."
  pytest test
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
