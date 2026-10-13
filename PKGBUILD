# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-spsdk-jlink
_name=${pkgname#python-}
pkgver=0.3.12
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
sha512sums=('7deca1f3c65a40d15a4ba7fa4770a3ccb5b249bde693dd44b5d48385d16792377a89e688b6799c8ebee1222f8a805baaaa5ba5e2459aa470db6d176799952eca')

build() {
  cd ${srcdir}/$_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd ${srcdir}/$_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/
}
