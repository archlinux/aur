# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-spsdk-lauterbach
_name=${pkgname#python-}
pkgver=0.5.0
pkgrel=1
pkgdesc="Lauterbach debug probe plugin for SPSDK"
arch=(any)
url="https://pypi.org/project/${_name}"
license=(BSD-3-Clause)
depends=(
  python
  # AUR
  python-lauterbach-trace32-rcl
  python-spsdk
  pyinstaller
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
sha512sums=('6be9d3d3d422d39a1b3a630b98c26fd68f83cb6616c31ef5444735bca843e546bf4e80a9bb611289fc4d55f2cfccdb25a3c457926a9a5d5e31f6d3e125487a58')

build() {
  cd ${srcdir}/$_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd ${srcdir}/$_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/
}
