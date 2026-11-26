# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-spsdk-iped
_name=${pkgname#python-}
pkgver=0.1.2
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
options=(!debug)
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('099856b179b68f77985f23efbb5069ca5837736fd72ba5f932b5c7c4bc85b9d0ecda5d8f4e62d61d67acb7d64c8d89c5c727aec598e3c5eaa2d9839d2168472b')

build() {
  cd ${srcdir}/$_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd ${srcdir}/$_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/
}
