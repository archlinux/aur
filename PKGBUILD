# Maintainer: Rohit Goswami (HaoZeke) <rohit.goswami@aol.com>
pkgname=python-chemparseplot
pkgver=1.9.8
pkgrel=1
pkgdesc="Parsers and plotting tools for computational chemistry"
arch=('any')
url='https://pypi.org/project/chemparseplot/'
license=('MIT')
depends=('python' 'python-numpy' 'python-pint')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling' 'python-hatch-vcs')
source=("https://files.pythonhosted.org/packages/source/c/chemparseplot/chemparseplot-1.9.8.tar.gz")
sha256sums=('30ec8530500a792baec005a132ae12d6b384773ba878bbbaad1132485522b0fb')

build() {
  cd "chemparseplot-1.9.8"
  python -m build --wheel --no-isolation
}

package() {
  cd "chemparseplot-1.9.8"
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
