# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-nxp-codecheck
_name=${pkgname#python-}
pkgver=0.3.15
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
sha512sums=('2d5e15d092d36926108ab174430e7cf3561f52b1aaa0fdbc7ec44c36f3564a54a6ed20e07bc07094764c9a02b9431e107fd7f3e1991c752437c06718bdea3a1e')

build() {
  cd ${srcdir}/$_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd ${srcdir}/$_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/
}
