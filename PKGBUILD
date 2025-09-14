# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-spsdk-keyfactor
_name=${pkgname#python-}
pkgver=0.4.0
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
provides=(${_name})
conflicts=(${_name})
replaces=(${_name})
_name=${_name//-/_}
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('d992a67f4b434bf477e70597681f23c1f3f95788681771d01581d4dfb076dc6168e766cea271f206153d8f0759566ef0a3704c0d6ded11a59ae7c98c8f6fbf3f')

build() {
  cd ${srcdir}/$_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd ${srcdir}/$_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/
}
