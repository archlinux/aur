# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-spsdk-pkcs11
_name=${pkgname#python-}
pkgver=0.3.5
pkgrel=1
pkgdesc="Signature Provider plugin for SPSDK using PKCS#11 interface"
arch=(any)
url="https://pypi.org/project/${_name}"
license=(BSD-3-Clause)
depends=(
  python
  python-asn1crypto
  python-python-pkcs11
  # AUR
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
sha512sums=('422e82f412bfd8b395f118a39389c203ceef24b6a744a42f6b35224d1f8c8a08681b1c8fbf568a3d912d8d6ed027eddfe35ffe75981ce5881ee572ed48b69e2e')

build() {
  cd ${srcdir}/$_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd ${srcdir}/$_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/
}
