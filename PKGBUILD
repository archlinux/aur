# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-spsdk-keyfactor
_name=${pkgname#python-}
pkgver=0.4.3
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
checkdepends=()
optdepends=()
groups=(spsdk-plugins)
provides=(${_name})
conflicts=(${_name})
replaces=(${_name})
_name=${_name//-/_}
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('365b7f3169fee67886d58a9e3038cb402a3f588824d7a1582029ef7150320973ff942a04902fc6af6ed31cc14640e7443e161a4d2316bdc7187702a94a283991')

build() {
  cd ${srcdir}/$_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd ${srcdir}/$_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/
}
