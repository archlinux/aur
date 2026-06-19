# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-spsdk-jlink
_name=${pkgname#python-}
pkgver=0.3.4
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
sha512sums=('998d38ab993b09449073a0cc7d8cf17cf924f873927bed05d1ac6990eccf3c0fea3623dac9e1c69aa3f1428b170d7951d6e5410f4e93051b51ebc59775bb8d4a')

build() {
  cd ${srcdir}/$_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd ${srcdir}/$_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/
}
