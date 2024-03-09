# Maintainer: piernov <piernov@piernov.org>

pkgname=python-pep517
pkgver=0.13.1
pkgrel=1
pkgdesc='Wrappers to build Python packages using PEP 517 hooks'
arch=('any')
url='https://github.com/pypa/pep517'
license=('MIT')
depends=('python' 'python-pip')
makedepends=('python-flit-core' 'python-build' 'python-installer')
checkdepends=('python-pytest' 'python-testpath')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/p/pep517/pep517-$pkgver.tar.gz")
sha256sums=('1b2fa2ffd3938bb4beffe5d6146cbcb2bda996a5a4da9f31abffd8b24e07b317')

build() {
  cd "pep517-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "pep517-$pkgver"
  PYTHONPATH=./src pytest -x --disable-warnings
}

package() {
  export PYTHONHASHSEED=0
  cd "pep517-$pkgver"
  python -m installer --destdir="$pkgdir/" dist/*.whl
}

# vim:set ts=2 sw=2 et:
