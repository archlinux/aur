# Maintainer: Evan Chen <evan@evanchen.cc>

pkgname=axiom-axle
_name=axiom_axle
pkgver=1.3.0
pkgrel=1
pkgdesc='Lean evaluation and metaprogramming utilities for provers'
arch=(any)
url=https://github.com/AxiomMath/axiom-lean-engine
license=(MIT)
depends=(python python-aiohttp python-requests python-tenacity)
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
  LICENSE)
sha256sums=('276c067278ba309a5f810f6d518dd32e2a8058bb34e5a3e86769368d2ecd5478'
            'c7ad081bf14c9ebc3a308177dfe877fb79fb319b64577cda8be1c15fedb97458')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
