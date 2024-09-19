# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-zyc
_name=${pkgname#python-}
pkgver=1.0.0
pkgrel=0
pkgdesc="A GUI for searching and selecting parts and footprints for use in SKiDL."
arch=(any)
url="https://pypi.org/project/zyc"
license=('MIT')
groups=()
_py_deps=(
  wxpython
  # AUR
  kinparse
  pykicad
  skidl)
depends=(
  python
  "${_py_deps[@]/#/python-}")
makedepends=(python-build
  python-installer
  python-wheel
  python-setuptools)
optdepends=('kicad-library: part libraries')
provides=(${_name})
conflicts=(${_name})
options=('!emptydirs' '!strip' '!debug')
install=
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('5be57f1e0a6a6c738c4222a5fcc3dda9b7700ef8ff29c78ffa9a0b3964df6cc7')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
