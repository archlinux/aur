_name=pycddl
pkgname=python-$_name
pkgver=0.6.1
pkgrel=2
pkgdesc="Deserialize CBOR and/or do CDDL schema validation"
license=('MIT')
arch=('any')
url="https://pypi.org/project/pycddl/"
depends=('gcc-libs' 'glibc' 'python')
makedepends=('python-maturin' 'python-build' 'python-installer')
source=(https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz) 
sha512sums=('63e2f26347092b3f3fab9e46cca7c1a1716cfc8e6c3820d5aba942ba96ad22a1a3bff3e7ed6b6dcbb84b388a07ad82aad4849c45687003f6b11454ceae890458')

build() {
  cd "$srcdir/$_name-$pkgver"
  python -m build --no-isolation --wheel
}
package() {
  cd "$srcdir/$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
