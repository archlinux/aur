# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-spsdk-pylint-plugins
_name=${pkgname#python-}
pkgver=0.2.6
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
sha512sums=('1303b42ffa45b3a9c21ed7b7d047614b5990056dc695029b935667a19d3122d8601efe14b393840a0eb709e337ce33de0ecd4b99525b4adb5e83e651b5f82a89')

build() {
  cd ${srcdir}/$_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd ${srcdir}/$_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/
}
