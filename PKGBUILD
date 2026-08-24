# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-spsdk-pkcs11
_name=${pkgname#python-}
pkgver=0.3.8
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
sha512sums=('b9853de815f51f5720b5a3981c0542b44760e8203b7bc9757b84f7ecbb075814fdac9e7e6ce66d9ddc3adbbf15c2d7051f796fc34b100038d349bfcae529fea2')

build() {
  cd ${srcdir}/$_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd ${srcdir}/$_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/
}
