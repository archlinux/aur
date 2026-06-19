# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-spsdk-offline-signature-provider
_name=${pkgname#python-}
pkgver=0.2.1
pkgrel=1
pkgdesc="Offline Signature Provider for SPSDK."
arch=(any)
url="https://pypi.org/project/${_name}"
license=(BSD-3-Clause)
depends=(
  python
  # AUR
  python-spsdk
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
sha512sums=('1eebedc34179ad612aadf7b728f996fc941053295e9426a4d15e6d16ca22bd38e7b8ff72c67971e5d6407c7a8eac18c2695951267d5cafb66782abebd28325ad')

build() {
  cd ${srcdir}/$_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd ${srcdir}/$_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/
}
