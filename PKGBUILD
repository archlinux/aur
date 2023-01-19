# Maintainer: None
# Contributor: None

pkgname=python-prefixed
_name=${pkgname#python-}
pkgver=0.6.0
pkgrel=1
pkgdesc='Prefixed provides an alternative implementation of the built-in float which supports formatted output with SI (decimal) and IEC (binary) prefixes.'
arch=(any)
url="https://github.com/Rockhopper-Technologies/prefixed"
license=(MPL2)
depends=(python)
makedepends=(python-build python-installer python-wheel)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha256sums=('b39fbfac72618fa1eeb5b3fd9ed1341f10dd90df75499cb4c38a6c3ef47cdd94')

build() {
  cd prefixed-$pkgver
  python -m build --wheel --no-isolation
}

package(){
  cd prefixed-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
