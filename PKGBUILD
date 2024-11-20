pkgname=python-doc8
_pyname=doc8
pkgver=1.1.2
pkgrel=1
arch=(any)
pkgdesc="Style checker for Sphinx (or other) RST documentation"
url='https://pypi.python.org/pypi/doc8'
license=('Apache 2.0')
depends=('python-stevedore' 'python-pygments' 'python-docutils' 'python-restructuredtext_lint' 'python-tomli')
makedepends=(python-build python-installer python-wheel 'python-setuptools-scm>=7')
source=("https://files.pythonhosted.org/packages/source/d/${_pyname}/${_pyname}-${pkgver}.tar.gz")
sha256sums=('1225f30144e1cc97e388dbaf7fe3e996d2897473a53a6dae268ddde21c354b98')

build() {
  cd "$srcdir/$_pyname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_pyname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

