# Maintainer: None
# Contributor: None

pkgname=python-prefixed
_name=${pkgname#python-}
pkgver=0.5.0
pkgrel=1
pkgdesc='Prefixed provides an alternative implementation of the built-in float which supports formatted output with SI (decimal) and IEC (binary) prefixes.'
arch=(any)
url="https://github.com/Rockhopper-Technologies/prefixed"
license=(MPL2)
depends=(python)
makedepends=(python-build python-installer python-wheel)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha256sums=('b134d734136250b17b68eede65a3370fab0134412cb66bc8be3568ff05bdf8e4')

build() {
  cd prefixed-$pkgver
  python -m build --wheel --no-isolation
}

package(){
  cd prefixed-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
