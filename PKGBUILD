# Maintainer: Rohit Goswami (HaoZeke) <rohit.goswami@aol.com>
pkgname=python-wailord
pkgver=0.2.0
pkgrel=1
pkgdesc="Python library to interact with ORCA (rgpkgs batch/experiment shell)"
arch=('any')
url='https://pypi.org/project/wailord/'
license=('GPL-3.0-only')
depends=(
  'python'
  'python-chemparseplot'
  'python-click'
  'python-cookiecutter'
  'python-numpy'
  'python-pandas'
  'python-parsimonious'
  'python-pint'
  'python-pint-pandas'
  'python-yaml'
  'python-rgpycrumbs'
)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
source=("https://files.pythonhosted.org/packages/source/w/wailord/wailord-${pkgver}.tar.gz")
sha256sums=('e730674e04b80c557ba1825fe392bfcb3ce144f3a40223e1ad2e3e9c47864010')

build() {
  cd "wailord-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "wailord-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  if [[ -f LICENSE ]]; then
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  elif [[ -f LICENSE.txt ]]; then
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  fi
}
