# Maintainer: Rohit Goswami (HaoZeke) <rohit.goswami@aol.com>
pkgname=python-pytest-pep723
pkgver=0.1.0
pkgrel=1
pkgdesc="Pytest plugin verifying PEP 723 inline script metadata covers imports"
arch=('any')
url='https://pypi.org/project/pytest-pep723/'
license=('MIT')
depends=('python' 'python-pytest')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling' 'python-hatch-vcs')
source=("https://files.pythonhosted.org/packages/source/p/pytest-pep723/pytest_pep723-0.1.0.tar.gz")
sha256sums=('563d8268b942002c576ae24f75ce708725d42e5b1dad191c353f5ae120d0fae1')

build() {
  cd "pytest_pep723-0.1.0"
  python -m build --wheel --no-isolation
}

package() {
  cd "pytest_pep723-0.1.0"
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
