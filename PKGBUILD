# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-lauterbach-trace32-pystart
_name=${pkgname#python-}
pkgver=0.4.0
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
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('607cb189b8360f516860abafe2a6f2a0f9efaf1a3cd12dd525cd5b5bd4612860807871715ceaee6bf7c5b9c10a9c5d3617e833865909e42049487c2568288970')

build() {
  cd ${srcdir}/$_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd ${srcdir}/$_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/
}
