# Maintainer: Xavier Francisco <echo moc.liamg@ocsicnarf.n.reivax | rev>

_pyname=rfc8785
pkgname=python-rfc8785
pkgver=0.1.4
pkgrel=1
pkgdesc="Pure-Python implementation of RFC 8785 (JSON Canonicalization Scheme)"
arch=('any')
url="https://github.com/trailofbits/rfc8785.py"
license=('Apache-2.0')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-flit-core')
checkdepends=('python-pytest')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/$_pyname/$_pyname-$pkgver.tar.gz")
sha256sums=('e545841329fe0eee4f6a3b44e7034343100c12b4ec566dc06ca9735681deb4da')

build() {
  cd "$_pyname-$pkgver"
  # Upstream pins flit_core<4; Arch ships 4.0.0, which builds this
  # standard [project]-metadata package fine. Skip the version check.
  python -m build --wheel --no-isolation --skip-dependency-check
}

check() {
  cd "$_pyname-$pkgver"
  # Upstream ships the official RFC 8785 test vectors in the sdist
  PYTHONPATH=src python -m pytest
}

package() {
  cd "$_pyname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
