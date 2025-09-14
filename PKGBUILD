# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-lauterbach-trace32-rcl
_name=${pkgname#python-}
pkgver=1.1.3
pkgrel=1
pkgdesc="Lauterbach TRACE32 Python Remote Control Library"
arch=(any)
url="https://pypi.org/project/${_name}"
license=(MIT)
depends=(
  python
  # AUR
  #   python-spsdk
  #   python-pylink-square
  #   pyinstaller
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
sha512sums=('d15cb7d66366c67dffcb2c2bc9cd4162ff439482696d349add9131bb9900aa57d2bf0ab54ec3a315df93c76a05745212e383ff5a8bbc1e19a6910c199e562686')

build() {
  cd ${srcdir}/$_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd ${srcdir}/$_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/
}
