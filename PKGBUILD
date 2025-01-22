# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-bincopy
_name=bincopy
pkgver=20.1.0
pkgrel=1
pkgdesc="Mangling of various file formats that conveys binary information"
arch=(any)
url="https://github.com/eerimoq/bincopy"
license=(MIT)
depends=(
  python
  python-argparse-addons
  python-humanfriendly
  python-pyelftools
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(python-pytest)
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('421a434fc806447814945941a71cddc499cd9ddbee290af0065f36ac3dc00df2aefa397023f20c0b4ecac1be781494cbf1357e42b146ce8ef6aedf829c45f075')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_name-$pkgver
  pytest -vv
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname"
}
