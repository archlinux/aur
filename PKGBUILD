# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-spsdk-pemicro
_name=${pkgname#python-}
pkgver=0.3.5
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
sha512sums=('3e9100105f76186ebff195e78a1c49fbc2b7dfe44fbeea1db1603756e01d93a860b5e048bef32f16f9f7180ca71f5afaae99fb90483872da275432b275a17c2a')

build() {
  cd ${srcdir}/$_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd ${srcdir}/$_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/
}
