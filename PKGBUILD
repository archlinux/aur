# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-lauterbach-trace32-pystart
_name=${pkgname#python-}
pkgver=0.5.0
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
sha512sums=('4bc72635483fa9903b1ef2813ad93e5c155025f2c7bdf2abc8e47d03508e6d31c0d1752e1462eb0435c9a46ac2dc8bba489cf9598b0cb0e39f0f245d1976d0bd')

build() {
  cd ${srcdir}/$_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd ${srcdir}/$_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/
}
