# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
_name=pycddl
pkgname=python-$_name
pkgver=0.6.2
pkgrel=1
pkgdesc="Deserialize CBOR and/or do CDDL schema validation"
license=('MIT')
arch=('x86_64')
url="https://pypi.org/project/pycddl/"
depends=('gcc-libs' 'glibc' 'python')
makedepends=('python-maturin' 'python-build' 'python-installer')
source=(https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz) 
sha512sums=('1026356558a49469c5b687302ff6670f84d86b8ff5b462cbab52f0645169bef0749532aa382c0afcb3dba9e65271f52d2bd5198aa13ae01b9026bdd04420d973')

build() {
  cd "$srcdir/$_name-$pkgver"
  python -m build --no-isolation --wheel
}
package() {
  cd "$srcdir/$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
