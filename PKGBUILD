# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-spsdk-lauterbach
_name=${pkgname#python-}
pkgver=0.4.0
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
sha512sums=('144898125af0ca99a4bf1e451ac9beb128a85892ba6f07c633683c3b7162c60ff7a3e857ce0dfd6f188449cec067b5dec687c1c087a480c0912dbab86ae9074b')

build() {
  cd ${srcdir}/$_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd ${srcdir}/$_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/
}
