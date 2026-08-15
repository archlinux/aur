# Maintainer: Evan Chen <evan@evanchen.cc>

pkgname=axiom-axle
_name=axiom_axle
pkgver=1.7.0
pkgrel=1
pkgdesc='Lean evaluation and metaprogramming utilities for provers'
arch=(any)
url=https://github.com/AxiomMath/axiom-lean-engine
license=(MIT)
depends=(python python-aiohttp python-requests python-tenacity)
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
  LICENSE)
b2sums=('bcca2d6d192c319830d18ca053365ba38468b75d5416acfc0c0e9626fdbed4943d0d650a36257c6892ba9c252bb96d4e384d395901c5ceeef7461a26277063ca'
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
