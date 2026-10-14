# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-spsdk-iped
_name=${pkgname#python-}
pkgver=0.1.1
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
sha512sums=('548dc4608cca6ca1a311e5c9ba754252157050029fee320e3f97c3511969ede410614a7d6fe1e1e1245c6631b5db7ebc55a4e3a877bc9fc069ebbd73cc748bec')

build() {
  cd ${srcdir}/$_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd ${srcdir}/$_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/
}
