pkgname=python-doc8
_pyname=doc8
pkgver=1.1.1
pkgrel=2
arch=(any)
pkgdesc="Style checker for Sphinx (or other) RST documentation"
url='https://pypi.python.org/pypi/doc8'
license=('Apache 2.0')
depends=('python-stevedore' 'python-chardet' 'python-docutils' 'python-six' 'python-restructuredtext_lint')
makedepends=(python-build python-installer python-wheel 'python-setuptools-scm>=7')
source=("https://files.pythonhosted.org/packages/source/d/${_pyname}/${_pyname}-${pkgver}.tar.gz" "scm.patch")

prepare() {
  cd "$srcdir/$_pyname-$pkgver"
  patch -p1 -i $srcdir/scm.patch
}

build() {
  cd "$srcdir/$_pyname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_pyname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

sha256sums=('d97a93e8f5a2efc4713a0804657dedad83745cca4cd1d88de9186f77f9776004'
            'fa5dad03044736139ba64ad72d6157e414a00124b4e4ec277dcb6d2a655935c3')
