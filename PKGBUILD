# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-spsdk-keyfactor
_name=${pkgname#python-}
pkgver=0.3.1
pkgrel=1
pkgdesc="SPSDK Signature Provider plugin using Keyfactor's API"
arch=(any)
url="https://pypi.org/project/${_name}"
license=(BSD-3-Clause)
depends=(
  python
  python-dotenv
  python-requests
  # AUR
  python-requests-pkcs12
  python-spsdk
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
sha512sums=('2ae0e61dbd95acf19ad41a04845bfe8c64f1256ce7ce82acdf91757145f11858a36244b6edc2ae941489bc9b46da7ae01b7935704173445b6fa2c202845b6d63')

build() {
  cd ${srcdir}/$_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd ${srcdir}/$_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/
}
