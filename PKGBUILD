# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-spsdk-lauterbach
_name=${pkgname#python-}
pkgver=0.3.1
pkgrel=1
pkgdesc="Lauterbach debug probe plugin for SPSDK"
arch=(any)
url="https://pypi.org/project/${_name}"
license=(BSD-3-Clause)
depends=(
  python
  # AUR
  python-spsdk
  python-lauterbach-trace32-rcl
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
sha512sums=('bfcc017bbcf664610823e462ade80ff6efb6f895789d11fd2348077f864ad2a247d91c9fb62975dee16788f223d829176df9c3a02163b3882a122d9822b89ac9')

build() {
  cd ${srcdir}/$_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd ${srcdir}/$_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/
}
