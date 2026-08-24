# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-spsdk-jlink
_name=${pkgname#python-}
pkgver=0.3.8
pkgrel=1
pkgdesc="J-Link Debug probe. A debugger probe plugin for SPSDK."
arch=(any)
url="https://pypi.org/project/${_name}"
license=(BSD-3-Clause)
depends=(
  python
  # AUR
  python-spsdk
  python-pylink-square
  pyinstaller
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-pytest
  python-click
)
optdepends=()
groups=(spsdk-plugins)
provides=(${_name})
conflicts=(${_name})
replaces=(${_name})
_name=${_name//-/_}
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('ca5761a8ee1f2524fe43ddcf900895af5edebccd9aa6fdeea932364a083f8157fac56a41710335c98d05d8e9c626ab81fe48e03e2ebe0ff4daadb05d33a333e8')

build() {
  cd ${srcdir}/$_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd ${srcdir}/$_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/
}
