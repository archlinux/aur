# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-lauterbach-trace32-rcl
_name=${pkgname#python-}
pkgver=1.1.5
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
sha512sums=('a97123e3e12d57d300419ab1049f72901f12bd339573213464551bcf0ea645b0e1a6d91650ee40dc23c5a8d2dfb660e0dcc9a0a638087862b705087a46ae6c48')

build() {
  cd ${srcdir}/$_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd ${srcdir}/$_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/
}
