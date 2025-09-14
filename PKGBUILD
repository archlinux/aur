# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-nxp-codecheck
_name=${pkgname#python-}
pkgver=0.3.1
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
  python-packaging
  python-prettytable
  python-pygithub
  python-tomli
  python-typing_extensions
  python-yaml
  # AUR
  #   python-spsdk
  #   python-pylink-square
  #   pyinstaller
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
sha512sums=('cfe37f38c8673bedfed77b7c5f6f32b551fca532e27fe708b5b4d704fd90fdb7d84cefcea983fdd4a449a5784985adda59c834db5ba420aee4cfe6f206d2f3d4')

build() {
  cd ${srcdir}/$_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd ${srcdir}/$_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/
}
