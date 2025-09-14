# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-spsdk-pemicro
_name=${pkgname#python-}
pkgver=0.3.3
pkgrel=3
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
sha512sums=('f8ac1e856784f6389134a5646336b2569e6a5f96c90501667b913c93caecf96eac435fa1ce4ce90d3a78dea43652c74c4057b82d05411dc38b8cb7ad04384246')

build() {
  cd ${srcdir}/$_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd ${srcdir}/$_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/
}
