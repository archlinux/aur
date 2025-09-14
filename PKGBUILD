# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-spsdk-pkcs11
_name=${pkgname#python-}
pkgver=0.3.3
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
provides=(${_name})
conflicts=(${_name})
replaces=(${_name})
_name=${_name//-/_}
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('8eb896ccd2f3623f2bfe620f1dd5740edb41c3352e24ae1ce9498257ef87fba409a9d2520de3c9f3b079f1018891b5bdedc597cc863f70cc1a83626b4c058822')

build() {
  cd ${srcdir}/$_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd ${srcdir}/$_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/
}
