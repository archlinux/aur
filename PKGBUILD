# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-spsdk-keyfactor
_name=${pkgname#python-}
pkgver=0.4.1
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
sha512sums=('9f852eaaa57d2f92c241227a8c30d39e0967b11b9cc5c713b22547f3bbe8d7fe8821401c6bbefd7fcbec1417c6e7aa9ea0cab7fe7a54babb868c20dc33ac5e0e')

build() {
  cd ${srcdir}/$_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd ${srcdir}/$_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/
}
