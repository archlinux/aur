# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-nxp-codecheck
_name=${pkgname#python-}
pkgver=0.3.16
pkgrel=1
pkgdesc="Simple set of checking tools for accepting code quality for NXP python projects"
arch=(any)
url="https://pypi.org/project/${_name}"
license=(BSD-3-Clause)
depends=(
  python
  python-click
  python-colorama
  python-defusedxml
  python-gitpython
  python-jinja
  python-packaging
  python-prettytable
  python-pygithub
  python-tomli
  python-typing_extensions
  python-yaml
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
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('92ed775ced5239a31e84fe2f85af8ee2d58b86deccd2b93e6c7a63f6ffd03fe5eeb8b5d4389e4452a4d7765fa6d0e8798eccd67b0fc56dea9218445d9bd7ad1c')

build() {
  cd ${srcdir}/$_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd ${srcdir}/$_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/
}
