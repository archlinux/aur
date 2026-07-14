# Maintainer: Rohit Goswami (HaoZeke) <rohit.goswami@aol.com>
pkgname=python-pychum
pkgver=1.4.3
pkgrel=1
pkgdesc="Input file generators for computational chemistry"
arch=('any')
url='https://pypi.org/project/pychum/'
license=('MIT')
depends=('python' 'python-ase' 'python-jinja' 'python-pint' 'python-rgpycrumbs' 'python-tomli')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling' 'python-hatch-vcs')
source=("https://files.pythonhosted.org/packages/source/p/pychum/pychum-1.4.3.tar.gz")
sha256sums=('a632fc9b50542cff43bf3213108927943ddcd718430c91c61282b27fbcb78977')

build() {
  cd "pychum-1.4.3"
  python -m build --wheel --no-isolation
}

package() {
  cd "pychum-1.4.3"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  if [[ -f LICENSE ]]; then
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  elif [[ -f LICENSE.txt ]]; then
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  else
    echo MIT > "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  fi
}
