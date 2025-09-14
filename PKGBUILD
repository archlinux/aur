# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-spsdk-offline-signature-provider
_name=${pkgname#python-}
pkgver=0.1.0
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
provides=(${_name})
conflicts=(${_name})
replaces=(${_name})
_name=${_name//-/_}
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('9a31eba972f187b1302d1258f6da90b193525e68ac60c059467f4d136c88ee6f69eac826a94fa8acae8750c36ad42c2ed75b043a2495c44ddf2d6671913c7b64')

build() {
  cd ${srcdir}/$_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd ${srcdir}/$_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/
}
