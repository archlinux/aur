# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
_name=pycddl
pkgname=python-$_name
pkgver=0.6.3
pkgrel=1
pkgdesc="Deserialize CBOR and/or do CDDL schema validation"
license=('MIT')
arch=('x86_64')
url="https://pypi.org/project/pycddl/"
depends=('gcc-libs' 'glibc' 'python')
makedepends=('python-maturin' 'python-build' 'python-installer')
source=(https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz) 
sha512sums=('32be3b112161bba118af3ec1f742b2e6ff690667ec71cc2f20576ee80869cfee2635c16493d3447447d73c996a1579f09286d8c54783b5dad1b238d16b950fb1')

build() {
  cd "$srcdir/$_name-$pkgver"
  python -m build --no-isolation --wheel
}
package() {
  cd "$srcdir/$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
