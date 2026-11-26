# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-spsdk-pqc
_name=${pkgname#python-}
pkgver=0.7.6
pkgrel=1
pkgdesc="Post-Quantum Crypto support for SPSDK"
arch=($CARCH)
url="https://pypi.org/project/${_name}"
license=(BSD-3-Clause)
depends=(
  glibc
  python
  python-click
  python-pyasn1
  python-pycryptodome
  python-typing_extensions
  # AUR
  pyinstaller
)
makedepends=(
  cmake
  python-build
  python-installer
  python-setuptools
  python-setuptools-scm
  python-toml
  python-wheel
)
checkdepends=(
  python-pytest

)
optdepends=()
groups=(spsdk-plugins)
# options=('!strip' '!debug')
provides=(${_name})
conflicts=(${_name})
replaces=(${_name})
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name//-/_}-${pkgver}.tar.gz")
sha512sums=('6d1a23604d51ef613ded91a07cda25c7e16ad7a6918b0d777ff0ee7c296a9d754d8bdb8811a8b461bc2a86ea66c28a4d5fb12cc01c5fdb22ab0e9d9cba0e76d6')
_name=${_name//-/_}

build() {
  cd ${srcdir}/$_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd ${srcdir}/$_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/
}
