# Maintainer: Evan Chen <evan@evanchen.cc>

pkgname=axiom-axle
_name=axiom_axle
pkgver=1.2.1
pkgrel=1
pkgdesc='Lean evaluation and metaprogramming utilities for provers'
arch=(any)
url=https://github.com/AxiomMath/axiom-lean-engine
license=(MIT)
depends=(python python-aiohttp python-requests python-tenacity)
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
  LICENSE)
sha256sums=('38796c205553049e989ede7c2f637cb2d4f79071bfe2db5c64671a30a1a98691'
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
