# Maintainer: Evan Chen <evan@evanchen.cc>

pkgname=axiom-axle
_name=axiom_axle
pkgver=1.9.0
pkgrel=1
pkgdesc='Lean evaluation and metaprogramming utilities for provers'
arch=(any)
url=https://github.com/AxiomMath/axiom-lean-engine
license=(MIT)
depends=(python python-aiohttp python-requests python-tenacity)
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
  LICENSE)
b2sums=('97672e049c5a07805e9aa424c5594aa711337140d8cbaf5fb714672ce666847b42c6f9fc2d879483d25f3d662c66a52c31af7dc834138299a959907056cecea0'
        'e9ec8a1968105008f490a9cf41adda1e809c1699eb1dd41a8a5c9b5a1d93bf0ba296104ac1c296c481facf33e8b4e87b7f24bfd90e5dbf65140f686837b34359')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
