# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-spsdk-offline-signature-provider
_name=${pkgname#python-}
pkgver=0.2.0
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
sha512sums=('ab682955b8c5c6915f4b5ee13eafe32e93a46663f1c885801781b9b3d5170c5d72c745d0adada2d62d833ca74ea210ea9cba6cef000f037e71a4782746e02ecb')

build() {
  cd ${srcdir}/$_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd ${srcdir}/$_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/
}
