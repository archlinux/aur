# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-spsdk-jlink
_name=${pkgname#python-}
pkgver=0.3.1
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
provides=(${_name})
conflicts=(${_name})
replaces=(${_name})
_name=${_name//-/_}
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('c8b6bd2ddfd2f03f3ccc1d6ff3f74b71126ad8f527d72fcdeda45c8ddac1e063dad9a5e1cd1dca7f3275fdce7f447f8be28127372a9d5ff7dc1a32e30643051e')

build() {
  cd ${srcdir}/$_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd ${srcdir}/$_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/
}
