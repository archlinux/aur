# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-lauterbach-trace32-rcl
_name=${pkgname#python-}
pkgver=1.1.6
pkgrel=1
pkgdesc="Lauterbach TRACE32 Python Remote Control Library"
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
sha512sums=('5509b15c5fba4f18cfb91e89b808b85524eaefe8a56ce16e4db5d51cb251e522d790a26b4445161f6a9d5252c2e84bd27eace04e7c4a5f29257ab045620c3fb6')

build() {
  cd ${srcdir}/$_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd ${srcdir}/$_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/
}
