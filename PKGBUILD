# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-spsdk-pylint-plugins
_name=${pkgname#python-}
pkgver=0.2.2
pkgrel=3
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
sha512sums=('d776921b27f2691547b64acf35f92d96f8070577152ca9d4989fefdb288e9ad4225245cc7ee1455acb8bd95a55cedb9ce17be1adb02b7b5cee0b692acab99a35')

build() {
  cd ${srcdir}/$_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd ${srcdir}/$_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/
}
