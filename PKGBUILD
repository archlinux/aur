# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-spsdk-lauterbach
_name=${pkgname#python-}
pkgver=0.5.6
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
sha512sums=('3fc5ccecbbb394bc5e6cc67dfb8d25a167d26fa12986f161e2f126686c8034a0e2ab0a5ef5be7d224fbf289af6818595668d2ca909942d7f5fad8c7d9bb6e48f')

build() {
  cd ${srcdir}/$_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd ${srcdir}/$_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/
}
