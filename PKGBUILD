# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-spsdk-iped
_name=${pkgname#python-}
pkgver=0.1.0
pkgrel=1
pkgdesc="Fast C++ PRINCE cipher backend for SPSDK IPED encryption"
arch=(any)
url="https://pypi.org/project/${_name}"
license=(BSD-3-Clause)
depends=(
  python
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=()
optdepends=()
groups=(spsdk-plugins)
provides=(${_name})
conflicts=(${_name})
replaces=(${_name})
_name=${_name//-/_}
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('1f0ee9acac22ac27d9cd629ff1d72d6447dd01a8b29edc6f04e4161a5cf07c648bcdc4c874a3241af2138050d6d498016989aedefbcc7d48d39260003f0fd25c')

build() {
  cd ${srcdir}/$_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd ${srcdir}/$_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/
}
