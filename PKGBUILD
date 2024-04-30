# Maintainer: Evan Chen <evan@evanchen.cc>

pkgname=python-grilops
_name=${pkgname#python-}
pkgver=0.10.3
pkgrel=1
pkgdesc='GRId LOgic Puzzle Solver'
arch=(any)
url=https://github.com/obijywk/grilops
license=(MIT)
depends=(python python-z3-solver)
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
  LICENSE)
sha256sums=('ee0871b402cf7be43a40314e7e8f4280f930ca413e0cb9533188b024e240d2e7'
  '7161cd1ef6b37818a00e227eadcbf69472f89978754145f3904d1e6d53dfc282')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
