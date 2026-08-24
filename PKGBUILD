# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-spsdk-pemicro
_name=${pkgname#python-}
pkgver=0.3.9
pkgrel=1
pkgdesc="P&E Micro debugger probe plugin. A debugger probe plugin for SPSDK."
arch=(any)
url="https://pypi.org/project/${_name}"
license=(BSD-3-Clause)
depends=(
  python
  # AUR
  python-spsdk
  python-pypemicro
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
sha512sums=('eef7673ec8336bf546f3fd91b5b4b2f192122c5c772f4bcd829d2f75b4db5c78484b36a925675b9cf89a738b0843f7ddf3d572393481efd2f24db08493dc95f6')

build() {
  cd ${srcdir}/$_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd ${srcdir}/$_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/
}
