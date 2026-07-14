# Maintainer: Rohit Goswami (HaoZeke) <rohit.goswami@aol.com>
pkgname=python-rgpycrumbs
pkgver=1.9.20
pkgrel=1
pkgdesc="Dispatcher-based analytical and computational suite for chemical physics"
arch=('any')
url='https://pypi.org/project/rgpycrumbs/'
license=('MIT')
depends=('python' 'python-click' 'python-numpy' 'python-rich')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling' 'python-hatch-vcs')
source=("https://files.pythonhosted.org/packages/source/r/rgpycrumbs/rgpycrumbs-1.9.20.tar.gz")
sha256sums=('6339b1ae039f6cafc2e7e2ab8c9d41022e87c90609cc0a47fa20cdef2ed6df44')

build() {
  cd "rgpycrumbs-1.9.20"
  python -m build --wheel --no-isolation
}

package() {
  cd "rgpycrumbs-1.9.20"
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
