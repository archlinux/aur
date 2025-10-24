# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-spsdk-pylint-plugins
_name=${pkgname#python-}
pkgver=0.2.3
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
groups=(spsdk-plugins)
provides=(${_name})
conflicts=(${_name})
replaces=(${_name})
_name=${_name//-/_}
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/${_name//_/-}/$_name-$pkgver.tar.gz")
sha512sums=('0734839877658bb34adc39f59a44a7f5f239a18b54c4f9806b7003b5f8cbb4c92b72b9c81f463d95201a6a562f04245ac8b5d308189eaceda991eb277b297f5f')

build() {
  cd ${srcdir}/$_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd ${srcdir}/$_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/
}
