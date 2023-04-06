# Maintainer:
# Contributor: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_name=rapidfuzz_capi
pkgname=python-${_name/_/-}
pkgver=1.0.5
pkgrel=4
pkgdesc='C-API of RapidFuzz, which can be used to extend RapidFuzz from separate packages'
arch=(any)
url='https://github.com/maxbachmann/rapidfuzz_capi'
license=(MIT)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha256sums=('b3af179874b28364ba1b7850e37d0d353de9cf5b844e3569c023b74da3a9c68e')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}
