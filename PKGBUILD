# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-lauterbach-trace32-rcl
_name=${pkgname#python-}
pkgver=1.1.4
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
sha512sums=('240d284190dff98f2f9a96803bd03fedd9faab7db7b9b4a2695d7c81d2f5126227ed00013b15b23cc04c4c7f30fb9976a22f455c209d3f83ebbcf6adbc1024c5')

build() {
  cd ${srcdir}/$_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd ${srcdir}/$_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/
}
