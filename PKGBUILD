# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-spsdk-pemicro
_name=${pkgname#python-}
pkgver=0.3.2
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
provides=(${_name})
conflicts=(${_name})
replaces=(${_name})
_name=${_name//-/_}
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('86a977369f597af4b465ec8267391ce865b9252109812e69516a079ff72af19b019cc38b811bbb5ac5615a833047a33c3e5fd75a656e34c37eb0a7d6f32a7444')

build() {
  cd ${srcdir}/$_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd ${srcdir}/$_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/
}
