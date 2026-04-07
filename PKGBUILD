# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-lauterbach-trace32-pystart
_name=${pkgname#python-}
pkgver=0.6.0
pkgrel=1
pkgdesc="start Lauterbach TRACE32"
arch=(any)
url="https://pypi.org/project/${_name}"
license=(MIT)
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
provides=(${_name})
conflicts=(${_name})
replaces=(${_name})
_name=${_name//-/_}
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('7969ba8afc3a6b1147aad5d9c613e3a45b2f7405eeaf86eb002a73b7a77091f86ae05396720c959f8b856382baf5eca08b12d255f3e29d67531ddb2bc7000687')

build() {
  cd ${srcdir}/$_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd ${srcdir}/$_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/
}
