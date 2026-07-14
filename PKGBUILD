# Maintainer: Rohit Goswami (HaoZeke) <rohit.goswami@aol.com>
pkgname=python-wailord
pkgver=0.1.3
pkgrel=1
pkgdesc="Python library to interact with ORCA"
arch=('any')
url='https://pypi.org/project/wailord/'
license=('MIT')
depends=('python' 'python-chemparseplot' 'python-click' 'python-cookiecutter' 'python-numpy' 'python-pandas' 'python-parsimonious' 'python-pint' 'python-yaml' 'python-rgpycrumbs')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling' 'python-hatch-vcs')
source=("https://files.pythonhosted.org/packages/source/w/wailord/wailord-0.1.3.tar.gz")
sha256sums=('6e5e6d0c9a2d2fae95c36780f4ec04916fce824eadb192c0f2b71fc8ae6fe7ad')

build() {
  cd "wailord-0.1.3"
  python -m build --wheel --no-isolation
}

package() {
  cd "wailord-0.1.3"
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
