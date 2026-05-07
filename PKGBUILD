# Maintainer: Victor <v1c70rp@gmail.com>
# Contributor: Techcable <Techcable at techcable dot net>

pkgname=mathics3-script
_pkgname=mathicsscript
pkgver=10.0.0
pkgrel=1
pkgdesc="A more advanced command-line interface to Mathics."
arch=("any")
url="https://mathics.org/"
license=('GPL3')
depends=("mathics3>=10.0.0"
         "mathics3-scanner>=10.0.0"
         "python-click>=8.0.0"
         "python-colorama"
         "python-columnize"
         "python-networkx"
         "python-prompt_toolkit>=3.0.18"
         "python-pygments>=2.9.0"
         "mathics3-pygments>=10.0.0"
         "python-term-background>=1.0.5")
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'python-pytest')
optdepends=(
    "python-yaml: Used for admin-tools/make-tables.sh to build JSON tables"
    "python-pyqt6: For interactive display of graphs via matplotlib"
    "python-cairosvg: For rendering plots and graphs as SVGs via matplotlib"
    "python-cson: for xasy"
    "python-matplotlib: For rendering SVG plots"
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/Mathics3/$pkgname/releases/download/$pkgver/$_pkgname-$pkgver.tar.gz")
sha256sums=('aeacd508ccf78a1c06007d815209f29c81422ac4861f24f502c6aa69f7622f4f')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  # Remove test that require mathics3-script installed before testing
  rm test/test_returncode.py
  export PYTHONPATH="."
  pytest test
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
