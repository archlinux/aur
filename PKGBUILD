# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-spsdk-pylint-plugins
_name=${pkgname#python-}
pkgver=0.2.1
pkgrel=1
pkgdesc="PyLint plugins coverity SPSDK-specific coding rules."
arch=(any)
url="https://pypi.org/project/${_name}"
license=(BSD-3-Clause)
depends=(
  python
  python-astroid
  python-pylint
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
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/${_name//_/-}/$_name-$pkgver.tar.gz")
sha512sums=('b1ea3a3eabfedce9cb52fc00e1f5a619ed769f3d9cf9e948b00b63cc9fd4aad73e59f614ff6578bde1be42ef259b557c5350f28f6706ae09e307f104fc10113e')

build() {
  cd ${srcdir}/$_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd ${srcdir}/$_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/
}
